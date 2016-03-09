class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.references :event, index: true, foreign_key: true
      t.string :title
      t.text :description
    end
  end
end
