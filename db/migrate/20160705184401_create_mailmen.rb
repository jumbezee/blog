class CreateMailmen < ActiveRecord::Migration
  def change
    create_table :mailmen do |t|

      t.timestamps null: false
    end
  end
end
