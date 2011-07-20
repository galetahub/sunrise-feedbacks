class FeedbackAnswer < ActiveRecord::Base
  include Sunrise::Models::FeedbackAnswer
  
  attr_accessible :content

  # Validations
  validates :content, :presence => true, :length => { :maximum => 500 }
  validates :author_type, :inclusion => { :in => %w( User ) }
end
