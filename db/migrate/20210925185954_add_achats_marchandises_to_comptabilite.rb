class AddAchatsMarchandisesToComptabilite < ActiveRecord::Migration[6.0]
  def change
    add_column :comptabilites, :achats_marchandises, :integer
  end
end
