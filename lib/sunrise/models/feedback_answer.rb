# encoding: utf-8
module Sunrise
  module Models
    module FeedbackAnswer
      def self.included(base)
        base.send :include, InstanceMethods
        base.send :extend, ClassMethods
      end
      
      module ClassMethods
        def self.extended(base)
          base.class_eval do
            belongs_to :author, :polymorphic => true
            belongs_to :message, :class_name => 'FeedbackMassage', :foreign_key => :message_id, :counter_cache => true
            
            default_scope order("#{quoted_table_name}.id DESC")
            scope :recently, order("#{quoted_table_name}.created_at DESC")
          end
        end
      end
      
      module InstanceMethods
      end
    end
  end
end
