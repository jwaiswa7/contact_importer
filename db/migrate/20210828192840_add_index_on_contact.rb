class AddIndexOnContact < ActiveRecord::Migration[6.0]
  def change
  	 add_index :contacts, [:user_id, :email], unique: true
  end
end
