class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.string :client
      t.integer :amout
      t.datetime :date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
