class CreateSocietes < ActiveRecord::Migration[6.0]
  def change
    create_table :societes do |t|
      t.references :user, null: false, foreign_key: true
      t.string :denomination_sociale
      t.integer :apports
      t.integer :capital_social
      t.integer :duree
      t.integer :nombre_actions
      t.integer :valeur_actions
      t.integer :numero_RCS

      t.timestamps
    end
  end
end
