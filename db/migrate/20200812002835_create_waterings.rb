class CreateWaterings < ActiveRecord::Migration[6.0]
  def change
    create_table :waterings do |t|
      t.integer :volume
      t.integer :minutes
      t.belongs_to :plant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
