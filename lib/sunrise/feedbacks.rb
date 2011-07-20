# encoding: utf-8
module Sunrise  
  module Feedbacks
    autoload :Author, 'sunrise/feedbacks/author'
    
    mattr_accessor :navigational_formats
    @@navigational_formats = [:html]
    
    mattr_accessor :siblings_keys
    @@siblings_keys = [:user_email]
    
    # Default way to setup Sunrise Feedbacks. 
    def self.setup
      yield self
    end
  end
end

require 'sunrise/feedbacks/version'
require 'sunrise/feedbacks/engine'
