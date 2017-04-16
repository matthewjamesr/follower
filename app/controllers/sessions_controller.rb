class SessionsController < ApplicationController
  def welcome
  end

  def create
    @user = User.find_or_create_from_auth_hash(auth_hash)
    session[:user_id] = @user.id

    if @user.first_visit
      client = Mastodon::REST::Client.new(base_url: "https://" + @user.instance, bearer_token: @user.token)
      client.create_status("TEST: I just #subscribed to my friends #tweets through #Follower. You should too! :smile: \n\nhttps://fake-follower-link.io")
      @user.first_visit = false
      @user.save
    end

    redirect_to root_path
  end

  def destroy
    if current_user
      session.delete(:user_id)
      flash[:success] = "Sucessfully logged out!"
    end
    redirect_to root_path
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
