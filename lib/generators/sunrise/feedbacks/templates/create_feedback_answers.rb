class SunriseCreateFeedbackAnswers < ActiveRecord::Migration
  def self.up
    create_table :feedback_answers do |t|
      t.text :content, :null => false
      t.integer :message_id, :null => false
      
      t.integer :author_id
      t.string :author_type, :limit => 30
    
      t.timestamps
    end
    
    add_index :feedback_answers, [:author_type, :author_id]
    add_index :feedback_answers, :message_id
  end

  def self.down
    drop_table :feedback_answers
  end
end
