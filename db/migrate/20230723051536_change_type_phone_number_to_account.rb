class ChangeTypePhoneNumberToAccount < ActiveRecord::Migration[7.0]
  def change
    change_column :accounts, :phone_number, :bigint
  end
end
