class ChangeUserIdDataTypeToRides < ActiveRecord::Migration[5.2]
  def change
    change_column :rides, :user_id, :integer
  end
end
