class CreateUserStocks < ActiveRecord::Migration[5.0]
  def change
    create_table :user_stocks do |t|
      #t.integer :user_id
      #t.integer :stock_id
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :stock, index: true, foreign_key: true
      t.timestamps
    end
  end
end
