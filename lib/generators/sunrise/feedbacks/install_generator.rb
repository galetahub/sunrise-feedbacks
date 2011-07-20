require 'rails/generators'
require 'rails/generators/migration'

module Sunrise
  module Feedbacks
    class InstallGenerator < Rails::Generators::Base
      include Rails::Generators::Migration
      
      source_root File.expand_path(File.join(File.dirname(__FILE__), 'templates'))
      class_option :migrations, :type => :boolean, :default => true, :description => "Generate migrations files"

      desc "Generates comment migration and model"

      def self.current_time
        @current_time ||= Time.now
        @current_time += 1.minute
      end

      def self.next_migration_number(dirname)
        current_time.strftime("%Y%m%d%H%M%S")
      end
      
      def create_model
        copy_file('feedback_message.rb', 'app/models/feedback_message.rb')
        copy_file('feedback_answer.rb', 'app/models/feedback_answer.rb')
      end
      
      def create_migration
        if options.migrations
          migration_template "create_feedback_messages.rb", File.join('db/migrate', "sunrise_create_feedback_messages.rb")
          migration_template "create_feedback_answers.rb", File.join('db/migrate', "sunrise_create_feedback_answers.rb")
        end
      end
    end
  end
end
