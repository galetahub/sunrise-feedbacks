# encoding: utf-8
module Sunrise
  module Models
    module FeedbackMessage
      def self.included(base)
        base.send :include, InstanceMethods
        base.send :extend, ClassMethods
      end
      
      module ClassMethods
        def self.extended(base)
          base.class_eval do
            has_many :answers, :class_name => 'FeedbackAnswer', :foreign_key => :message_id, :dependent => :delete_all
            belongs_to :author, :polymorphic => true
            
            before_validation :make_author
            
            default_scope order("#{quoted_table_name}.id DESC")
            scope :recently, order("#{quoted_table_name}.created_at DESC")
            scope :with_author, lambda { |item| where(:author_type => item.author_type, :author_id => item.author_id) }
            scope :with_email, lambda { |email| where(:user_email => email) }
            scope :with_phone, lambda { |phone| where(:phone_number => phone) }
          end
        end
        
        def siblings_for(record)
          query = scoped
          
          Sunrise::Feedbacks.siblings_keys.each do |key|
            query = query.where(["#{key} = ?", record.send(key)])
          end
          
          query
        end
      end
      
      module InstanceMethods
        
        def anonymous?
          author.nil?
        end
        
        def siblings
          self.class.siblings_for(self)
        end
        
        def email_address_with_name
          "#{user_name} <#{user_email}>"
        end
    
        protected
    
          def make_author
            unless author.nil?
              self.user_email = author.email if author.respond_to?(:email)
              self.user_name = author.name if author.respond_to?(:name)
            end
          end
      end
    end
  end
end
