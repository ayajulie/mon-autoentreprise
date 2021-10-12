class FixColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :devis, :date, :devis_at
  end
end
