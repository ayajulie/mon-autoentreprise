class CreateControleDeGestions < ActiveRecord::Migration[6.0]
  def change
    create_table :controle_de_gestions do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :cost
      t.integer :variable_cost
      t.integer :unit_cost
      t.integer :budget

      t.timestamps
    end
  end
end
