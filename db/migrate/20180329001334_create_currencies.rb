class CreateCurrencies < ActiveRecord::Migration[5.1]
  def up
    create_table :currencies do |t|
        t.string :name
        t.integer :price
        t.integer :user_id
    end
  end

  def down
    drop_table :currencies
  end
end
