class AddVentesMarchandisesToComptabilite < ActiveRecord::Migration[6.0]
  def change
    add_column :comptabilites, :ventes_marchandises, :integer
  end
end
