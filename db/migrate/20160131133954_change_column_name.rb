class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :events, :school, :location
  end
end
