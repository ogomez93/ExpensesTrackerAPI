class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :last_name
      t.string :email, null: false, default: ""
      t.string :phone_number

      t.timestamps
    end
  end
end
