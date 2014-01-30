class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.text :nickname
      t.text :email
      t.text :url

      t.timestamps
    end
  end
end
