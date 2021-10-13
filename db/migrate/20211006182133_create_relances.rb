class CreateRelances < ActiveRecord::Migration[6.0]
  def change
    create_table :relances do |t|
      t.string :name
      t.datetime :creance_at
      t.integer :creance
      t.decimal :interests

      t.timestamps
    end
  end
end
