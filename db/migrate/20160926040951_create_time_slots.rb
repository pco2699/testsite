class CreateTimeSlots < ActiveRecord::Migration
  def change
    create_table :time_slots do |t|
      t.references :user, index: true, foreign_key: true
      t.datetime :date_from
      t.datetime :date_to

      t.timestamps null: false
    end
  end
end
