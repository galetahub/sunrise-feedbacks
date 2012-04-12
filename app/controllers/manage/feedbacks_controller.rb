class Manage::FeedbacksController < Manage::BaseController
  inherit_resources
  defaults :route_prefix => 'manage', :resource_class => FeedbackMessage

  load_and_authorize_resource :class => FeedbackMessage
  
  has_scope :with_email, :as => :user_email, :only => :index
  has_scope :with_phone, :as => :phone_number, :only => :index
  order_by :created_at, :updated_at
  
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
      @feedbacks = (@feedbacks || end_of_association_chain).order(search_filter.order).page(params[:page])
    end
end
