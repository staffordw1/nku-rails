class CreateAttendences < ActiveRecord::Migration
  def change
    create_table :attendences do |t|
      t.date :attended_on
      t.string :seat
      t.integer :student_id
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
