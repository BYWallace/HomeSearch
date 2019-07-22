class AddValidationToTransactions < ActiveRecord::Migration[5.1]
  def up
    change_column_null :uploaded_transactions, :address, false
    change_column_null :uploaded_transactions, :city, false
    change_column_null :uploaded_transactions, :state, false
    change_column_null :uploaded_transactions, :zip, false
    change_column_null :uploaded_transactions, :selling_price, false
    change_column_null :uploaded_transactions, :selling_date, false
  end

  def down
    change_column_null :uploaded_transactions, :address, true
    change_column_null :uploaded_transactions, :city, true
    change_column_null :uploaded_transactions, :state, true
    change_column_null :uploaded_transactions, :zip, true
    change_column_null :uploaded_transactions, :selling_price, true
    change_column_null :uploaded_transactions, :selling_date, true
  end
end
