class SunriseCreateFeedbackMessages < ActiveRecord::Migration
  def self.up
    create_table :feedback_messages do |t|
      t.string :user_name, :limit => 50
      t.string :user_email, :limit => 50
      t.integer :phone_number, :limit => 8
      t.text :content, :null => false
      t.text :content_html
      t.integer :answers_count, :default => 0

      t.integer :author_id
      t.string :author_type, :limit => 30
    
      t.timestamps
    end
    
    add_index :feedback_messages, [:author_type, :author_id]
    add_index :feedback_messages, :user_email
    add_index :feedback_messages, :phone_number
  end

  def self.down
    drop_table :feedback_messages
  end
end
