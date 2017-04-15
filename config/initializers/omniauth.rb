Rails.application.config.middleware.use OmniAuth::Builder do
  callback_url = ENV["mastodon_callback_url"]
  provider :mastodon, scope: 'read write follow', credentials: lambda { |domain, callback_url|
    client = MastodonClient.where(domain: domain).first_or_initialize(domain: domain)

    return [client.client_id, client.client_secret] unless client.new_record?

    new_client = Mastodon::REST::Client.new(base_url: "https://#{domain}").create_app('Follower Test', callback_url, 'read write follow')

    client.client_id = new_client.client_id
    client.client_secret = new_client.client_secret
    client.save

    [client.client_id, client.client_secret]
  }
end
