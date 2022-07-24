class CreateApiV1Users < ActiveRecord::Migration[6.1]
  def change
    create_table :api_v1_users do |t|
      t.string :name
      t.string :locale
      t.string :uid

      t.timestamps
    end
  end
end
