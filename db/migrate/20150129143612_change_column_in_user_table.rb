class ChangeColumnInUserTable < ActiveRecord::Migration
  def change
    rename_column :questions, :pre_filled_field_hint, :prefilled_field_hint
  end
end
