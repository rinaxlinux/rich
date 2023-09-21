class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.date :birthday
      t.string :name
      t.string :blood
      t.string :hobby
      t.string :character

      t.timestamps
    end
  end
end
