Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, "vSapJky5iuX6RRU8Kn08eV5MF", "IkJ87aYqFIlrmL5GDSUBdvEFnLujA5a8BAHWQrPpITtnysOEtP" #ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']

  provider :hipchat, "6faf027f-bf3e-4d08-ab5b-21efc8bb4db9", "yQcjf6mvMINi2X8Lz5s1hqP6yvHnS5z5g0brqgjq", scope: "view_group admin_group"

  #provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'],
  #         scope: 'public_profile', info_fields: 'id,name,link'

  #provider :google_oauth2, ENV["GOOGLE_CLIENT_ID"], ENV["GOOGLE_SECRET"],
  #         scope: 'profile', image_aspect_ratio: 'square', image_size: 48, access_type: 'online', name: 'google',
  #         access_type: "offline", skip_jwt: true

  #provider :linkedin, ENV['LINKEDIN_KEY'], ENV['LINKEDIN_SECRET'],
  #         scope: 'r_basicprofile',
  #         fields: ['id', 'first-name', 'last-name', 'location', 'picture-url', 'public-profile-url']

  OmniAuth.config.on_failure = Proc.new do |env|
    SessionsController.action(:auth_failure).call(env)
    # error_type = env['omniauth.error.type']
    # new_path = "#{env['SCRIPT_NAME']}#{OmniAuth.config.path_prefix}/failure?message=#{error_type}"
    # [301, {'Location' => new_path, 'Content-Type' => 'text/html'}, []]
  end
end