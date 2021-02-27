class OauthController < ApplicationController
  # display request link
  def index
  end

  redirect as to not expose application key
  def request_authorization_redirect
    redirect_to client_options.authorization_uri
  end

  # set api authorization in session
  def callback

  end
  private

  def client_options
    {
      client_id: Rails.application.credintials.unifa_client_id,
      client_secret: Rails.application.credintials.unifa_client_secret,
      authorization_uri: 'https://arcane-ravine-29792.herokuapp.com/oauth/authorize',
      # redirect_uri: "http://localhost:3000/oauth/callback"
    }
  end

end
