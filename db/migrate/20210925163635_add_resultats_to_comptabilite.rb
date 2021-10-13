class AddResultatsToComptabilite < ActiveRecord::Migration[6.0]
  def change
    add_column :comptabilites, :resultats, :integer
  end
end
