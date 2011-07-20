class FeedbackMessage < ActiveRecord::Base
  include Sunrise::Models::FeedbackMessage
  
  attr_accessible :user_name, :user_email, :content

  # Validations
  validates :content, :presence => true, :length => { :maximum => 500 }
  validates :author_type, :inclusion => { :in => %w( User ) }, :allow_blank => true
  
  with_options :if => :anonymous? do |anonymous|
    anonymous.validates :user_name, :length => { :maximum => 100 }, :presence => true,
              :format => { :with => /\A[^[:cntrl:]\\<>\/&]*\z/ }
    anonymous.validates :user_email, :length => { :within => 6..100 }, :presence => true,
              :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }
  end

  # Format feedback content
  auto_html_for :content do
    html_escape
    image
    youtube :width => 500, :height => 300
    vimeo :width => 500, :height => 300
    link :target => "_blank", :rel => "nofollow"
    simple_format
    sanitize
  end
end
