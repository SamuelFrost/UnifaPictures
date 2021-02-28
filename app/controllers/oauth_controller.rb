# consider renaming if application were to begin growing as different apis could cause confusion
class OauthController < ApplicationController
  # display request link
  def index
  end

  # redirect to unifa API
  def request_authorization_redirect
    # using an Oauth gem may simplify this
    parameters = {response_type: "code", client_id: client_options[:client_id], redirect_uri: client_options[:redirect_uri], state: nil, scope: nil}
    uri = URI(client_options[:authorization_uri])
    uri.query = parameters.to_query
    redirect_to uri.to_s
  end

  # set api authorization in session
  def callback
    # using an Oauth gem may simplify this
    session[:unifa_twitter_token_code] = params[:code]
    uri = URI(client_options[:authorization_response_uri])
    response = Net::HTTP.post_form(uri, code: session[:unifa_twitter_token_code], client_id: client_options[:client_id], grant_type: "authorization_code" , redirect_uri: client_options[:redirect_uri], state: nil)
    session[:unifa_twitter_authorization] = JSON.parse(response.body)["access_token"]
    redirect_to pictures_path
  end

  private

  def client_options
    {
      client_id: Rails.application.credentials.unifa_client_id,
      client_secret: Rails.application.credentials.unifa_client_secret,
      authorization_uri: 'https://arcane-ravine-29792.herokuapp.com/oauth/authorize',
      redirect_uri: "http://localhost:3000/oauth/callback", # API server will not dynamically reassign
      authorization_response_uri: 'https://arcane-ravine-29792.herokuapp.com/oauth/token'
    }
  end
end
