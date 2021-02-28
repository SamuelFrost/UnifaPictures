module OauthHelper
  private

  def client_options
    {
      client_id: Rails.application.credentials.unifa_client_id,
      client_secret: Rails.application.credentials.unifa_client_secret,
      authorization_uri: 'https://arcane-ravine-29792.herokuapp.com/oauth/authorize',
      redirect_uri: "http://localhost:3000/oauth/callback", # API server will not dynamically reassign
      authorization_response_uri: 'https://arcane-ravine-29792.herokuapp.com/oauth/token',
      tweet_uri: 'https://arcane-ravine-29792.herokuapp.com/api/tweets'
    }
  end
end
