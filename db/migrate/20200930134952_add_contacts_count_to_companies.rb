class AddContactsCountToCompanies < ActiveRecord::Migration[6.0]
  def change
    add_column :companies, :contacts_count, :integer
  end
end
