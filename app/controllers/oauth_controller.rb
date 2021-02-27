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

  end
  private

  def client_options
    {
      client_id: Rails.application.credentials.unifa_client_id,
      client_secret: Rails.application.credentials.unifa_client_secret,
      authorization_uri: 'https://arcane-ravine-29792.herokuapp.com/oauth/authorize',
      redirect_uri: "http://localhost:3000/oauth/callback" # API server will not dynamically reassign
    }
  end
end
