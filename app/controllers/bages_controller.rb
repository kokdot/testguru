class BagesController < ApplicationController

  def index
    @bages = Bage.all
  end

  def bages_by_user
    @bages = current_user.bages
  end
end
