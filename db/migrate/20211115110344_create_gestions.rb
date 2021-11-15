class CreateGestions < ActiveRecord::Migration[6.0]
  def change
    create_table :gestions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :invoice, null: false, foreign_key: true
      t.integer :cost
      t.integer :variable_cost
      t.integer :unit_cost

      t.timestamps
    end
  end
end
