class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.references :organizer, index: true, foreign_key: true
      t.references :teacher, index: true, foreign_key: true
      t.string :name
      t.datetime :event_day
      t.string :school

      t.timestamps null: false
    end
  end
end
