class CreateInfos < ActiveRecord::Migration
  def change
    create_table :infos do |t|
      t.string :title
      t.text :description
      t.integer :ordinal

      t.timestamps null: false
    end
  end
end
