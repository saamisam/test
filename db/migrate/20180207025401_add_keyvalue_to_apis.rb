class AddKeyvalueToApis < ActiveRecord::Migration[5.1]
  def change
    add_column :apis, :keyvalue, :string
  end
end
