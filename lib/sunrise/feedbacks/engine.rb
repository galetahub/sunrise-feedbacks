require 'rails'
require 'sunrise-feedbacks'

module Sunrise
  module Feedbacks
    class Engine < ::Rails::Engine
      config.before_initialize do
        Sunrise::Plugin.register :feedbacks do |plugin|
          plugin.model = [:feedback_message, :feedback_answer]
          plugin.menu = 'select'
          plugin.klass_name = 'FeedbackMessage'
          plugin.version = Sunrise::Feedbacks::VERSION.dup
        end
        
        Sunrise::Plugins.activate(:feedbacks)
      end
    end
  end
end
