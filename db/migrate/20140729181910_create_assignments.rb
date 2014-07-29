class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.string :role
      t.integer :person_id
      t.integer :location_id
    end
  end
end
