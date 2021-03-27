class Admin::BagesUsersController < ApplicationController
  def index
    @bages_users = BagesUser.bages_user
  end
end
