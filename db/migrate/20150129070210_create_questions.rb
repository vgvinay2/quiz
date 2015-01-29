class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :type
      t.string :name
      t.string :pre_filled_field_hint
      t.string :mandatory
      t.integer :max_input_length
      t.integer :input_field_length
      t.integer :min_number
      t.integer :max_number
      t.integer :max_length
      t.integer :created_by
      t.integer :updated_by
      t.integer :entity_id
      t.string :entity_type
      t.string :specific_to
      t.string :default_value

      t.timestamps
    end
  end
end
