class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :application_id
      t.string :name

      t.timestamps null: false
    end
  end
end
