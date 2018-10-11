class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username, uniqueness: true, presence: true

      t.timestamps
    end
  end
end
