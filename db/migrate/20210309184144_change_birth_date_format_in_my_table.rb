class ChangeBirthDateFormatInMyTable < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :birth_date, :string
  end
end


