class AddStatusToGoals < ActiveRecord::Migration
  def change
    add_column :goals, :status, :string
    add_column(:goals, :created_at, :datetime)
    add_column(:goals, :updated_at, :datetime)
  end
end
