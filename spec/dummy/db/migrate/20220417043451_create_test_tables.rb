class CreateTestTables < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string  :text
      t.string  :text2
      t.timestamps
    end
  end
end
