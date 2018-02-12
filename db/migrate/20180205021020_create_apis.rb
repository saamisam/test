class CreateApis < ActiveRecord::Migration[5.1]
  def change
    add_column :keyvalue, :secretvalue
    create_table :apis do |t|
      t.string :user_email
      t.string :nonce
      t.string :challenge_code
      t.string :keyvalue
      t.string :secretvalue
      t.timestamps
    end
  end
end
