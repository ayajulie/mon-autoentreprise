class AddCompanyInfoToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :company_name, :string
    add_column :users, :company_address, :string
    add_column :users, :company_city, :string
    add_column :users, :company_zipcode, :string
    add_column :users, :company_country, :string
    add_column :users, :company_country, :string
    add_column :users, :start_activity, :datetime
    add_column :users, :activity_type, :datetime
    add_column :users, :seasonal_activity, :boolean
    add_column :users, :itinerant_activity, :boolean
    add_column :users, :employee, :boolean
    add_column :users, :partner, :boolean
    add_column :users, :siren, :string






  end
end
