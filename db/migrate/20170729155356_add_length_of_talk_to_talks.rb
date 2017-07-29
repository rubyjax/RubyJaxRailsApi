class AddLengthOfTalkToTalks < ActiveRecord::Migration[5.1]
  def change
    add_column :talks, :length_of_talk, :integer
  end
end
