class AddSuccessToDevis < ActiveRecord::Migration[6.0]
  def change
    add_column :devis, :success, :boolean
  end
end
