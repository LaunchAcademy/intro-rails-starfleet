class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.string :name, null: false

      t.belongs_to :starship

      t.timestamps
    end
  end
end
