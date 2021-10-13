class RemoveResultatFromComptabilite < ActiveRecord::Migration[6.0]
  def change
    remove_column :comptabilites, :resultat, :string
  end
end
