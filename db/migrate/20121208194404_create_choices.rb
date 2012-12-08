class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.integer :question_id
      t.string :text
      t.integer :position
      t.integer :count, :default => 0

      t.timestamps
    end
  end
end
