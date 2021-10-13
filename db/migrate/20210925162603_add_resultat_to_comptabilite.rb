class AddResultatToComptabilite < ActiveRecord::Migration[6.0]
  def change
    add_column :comptabilites, :resultat, :string
  end
end
