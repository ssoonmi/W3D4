class CreatePolls < ActiveRecord::Migration[5.2]
  def change
    create_table :polls do |t|
      t.integer :author_id, presence: true
      t.string :title, presence: true

      t.timestamps
    end

    add_index :polls, :author_id
  end


end
