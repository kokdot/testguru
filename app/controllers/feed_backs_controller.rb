class FeedBacksController < ApplicationController
  def new
  end

  def create
    FeedBackMailer.feed_back_send(params[:body]).deliver_now
  end
end
