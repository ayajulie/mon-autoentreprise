class AddNameToComptabilite < ActiveRecord::Migration[6.0]
  def change
    add_column :comptabilites, :name, :string
  end
end
