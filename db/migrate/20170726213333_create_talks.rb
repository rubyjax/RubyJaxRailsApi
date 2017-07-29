class CreateTalks < ActiveRecord::Migration[5.1]
  def change
    create_table :talks do |t|
      t.string :title
      t.string :category
      t.string :description

      t.timestamps
    end
  end
end
