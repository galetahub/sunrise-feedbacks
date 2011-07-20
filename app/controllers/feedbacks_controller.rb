class FeedbacksController < ApplicationController
  respond_to *Sunrise::Feedbacks.navigational_formats
  
  def new
    @feedback = FeedbackMessage.new
    @feedback.author = current_user
    respond_with(@feedback)
  end
  
  def create
    @feedback = FeedbackMessage.new(params[:feedback])
    @feedback.author = current_user
    @feedback.save
    
    respond_with(@feedback, :location => root_path)
  end
end
