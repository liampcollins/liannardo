def facebook_auth

  token_url = "https://graph.facebook.com/oauth/access_token?client_id=" + ENV["FACEBOOK_AUTH_CLIENT_ID"] + "&redirect_uri=http://localhost:3000&client_secret=" + ENV['FACEBOOK_AUTH_CLIENT_SECRET'] + " &code=" + params[:code]

  # $response = file_get_contents($token_url);
  
  # $params = null;
  # parse_str($response, $params);
  # $acces_token = $params['access_token'];
  
  # a = User.find(current_user.id)
  # a.facebook_token = params[:code]
  # a.save

  redirect_to :root


end