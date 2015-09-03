class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.integer :status
      t.time :response_time

      t.timestamps null: false
    end
  end
end
