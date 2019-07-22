class AddValidationToAgents < ActiveRecord::Migration[5.1]
  def up
    change_column_null :agents, :first_name, false
    change_column_null :agents, :last_name, false
  end

  def down
    change_column_null :agents, :first_name, true
    change_column_null :agents, :last_name, true
  end
end
