class HomeController < ApplicationController
  #before_action :authenticate_user!
  before_action :set_user, only: [:follow, :unfollow, :accept, :decline, :cancel]

  def index
     @users = if params[:search].present?
             User.where("username LIKE ?", "%#{params[:search]}%")
           else
             @users = []
           end
  end

  def about 
    @about_us = "Thrift N Tell was created to enable users to engage in a virtual thrift shopping experience and connect with others who share a passion for thrifting. This platform allows people to share and document their experiences across various thrift stores. A significant issue in the thrifting community is gatekeeping, where individuals limit access to information about specific thrift stores, ensuring that only a few benefit. This behavior fosters toxicity and prevents newcomers from enjoying a positive thrifting experience. Thrift N Tell aims to combat this mindset by serving as a hub for sharing valuable information, promoting inclusivity, and enhancing the thrifting experience for everyone."
  end

  def your_finds
    @posts = Post.all
  end

  def follow
    current_user.send_follow_request_to(@user)
    redirect_to your_finds_path
  end

  def unfollow
    current_user.unfollow(@user)
    redirect_to your_finds_path
  end

  def accept
    current_user.accept_follow_request_of(@user)
    make_it_a_friend_request
    redirect_to your_finds_path
  end

  def decline
    current_user.decline_follow_request_of(@user)
    redirect_to your_finds_path
  end

  def cancel
    current_user.remove_follow_request_for(@user)
    redirect_to your_finds_path
  end

  private

  def make_it_a_friend_request
    current_user.send_follow_request_to(@user)
    @user.accept_follow_request_of(current_user)
  end

  def set_user
    @user = User.find(params[:id])
end
end
