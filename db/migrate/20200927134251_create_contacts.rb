class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :phone
      t.references :user, null: false, foreign_key: true
      t.references :company, null: false, foreign_key: true
    end
  end
end
