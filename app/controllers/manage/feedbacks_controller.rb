class Manage::FeedbacksController < Manage::BaseController
  inherit_resources
  defaults :route_prefix => 'manage', :resource_class => FeedbackMessage
  
  before_filter :make_filter, :only=>[:index]

  load_and_authorize_resource :class => FeedbackMessage
  
  def show
    @feedbacks = @feedback.siblings
    @feedback_answer = FeedbackAnswer.new
    respond_with(@feedbacks)
  end
  
  def create
    create!{ manage_feedbacks_path }
  end
  
  def update
    update!{ manage_feedbacks_path }
  end
  
  def destroy
    destroy!{ manage_feedbacks_path }
  end
  
  protected
    
    def collection
      @feedbacks = (@feedbacks || end_of_association_chain).merge(@search.scoped).page(params[:page])
    end
    
    def make_filter
      @search = Sunrise::ModelFilter.new(FeedbackMessage, :attributes => [:user_email, :phone_number])
      @search.update_attributes(params[:search])
    end
end
