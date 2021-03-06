class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :name
      t.string :destination
      t.date :start
      t.date :end
      t.boolean :visible, :default => false, :null => false

      t.references :user

      t.timestamps
    end
  end
end
