class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.integer :question_id
      t.integer :created_by
      t.integer :updated_by
      t.string :name
      t.string :positive_value
      t.string :negative_value
      t.string :default_value

      t.timestamps
    end
  end
end
