class AddInfoToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :birth_last_name, :string
    add_column :users, :use_name, :string
    add_column :users, :pseudonym, :string
    add_column :users, :citizenship, :string
    add_column :users, :gender, :string

    add_column :users, :birth_date, :string
    add_column :users, :birth_city, :string
    add_column :users, :birth_department, :string
    add_column :users, :birth_country, :string

    add_column :users, :address, :string
    add_column :users, :city, :string
    add_column :users, :zipcode, :string
    add_column :users, :country :string

    add_column :users, :spouse_working_in_company, :boolean

    add_column :users, :email, :string
    add_column :users, :phone_number, :string
    add_column :users, :ssn, :string
    add_column :users, :remarks, :string


  end
end
