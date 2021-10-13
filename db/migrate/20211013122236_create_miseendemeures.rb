class CreateMiseendemeures < ActiveRecord::Migration[6.0]
  def change
    create_table :miseendemeures do |t|
      t.string :name
      t.string :adress
      t.string :refence
      t.date :day
      t.integer :amount
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
