# Follower

Your friendly interwebs Twitter follow bot for Mastodon.

# Goal

Enable Mastodon users to login to Follower via their instance accounts and follow
Twitter personas. Follower will Direct Message end-users with new posts every five
minutes.

# Setup

`git clone`

`bundle install`

`touch .env && nano .env` => `mastodon_callback_url=INSERT_YOUR_URL`

`rails s`
