class CreateEditeurs < ActiveRecord::Migration[6.0]
  def change
    create_table :editeurs do |t|
      t.references :user, null: false, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
