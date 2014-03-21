class RenameAttendences < ActiveRecord::Migration
  def self.up
    rename_table :attendences, :attendances
  end

 def self.down
   rename_table :attendances, :attendences
 end
end
