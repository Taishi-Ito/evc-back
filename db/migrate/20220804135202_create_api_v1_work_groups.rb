class CreateApiV1WorkGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :api_v1_work_groups do |t|
      t.string :title
      t.references :api_v1_user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
