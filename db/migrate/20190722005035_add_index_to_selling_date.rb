class AddIndexToSellingDate < ActiveRecord::Migration[5.1]
  def change
    add_index :uploaded_transactions, :selling_date
  end
end
