namespace :follower do
  desc "Scan for newly minted tweets and post them to user's Mastodon timeline."
  task scan: :environment do
    @users = User.all

    @users.each do |u|
      client = Mastodon::REST::Client.new(base_url: "https://" + u.instance, bearer_token: u.token)
      client.create_status("TEST: I am a fake tweet fakely found from a rake task :smile: \n\nSee it on #Twitter: https://fake-tweet-link.io", nil, [], "private")
    end
  end

end
