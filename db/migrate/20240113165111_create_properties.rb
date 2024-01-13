class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.string :name
      t.string :address
      t.text :owners
      t.float :size
      t.string :limit_type
      t.string :registration_number
      t.string :CCIR
      t.string :CAR

      t.timestamps
    end
  end
end
