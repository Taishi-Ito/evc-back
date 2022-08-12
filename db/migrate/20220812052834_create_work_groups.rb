class CreateWorkGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :work_groups do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title

      t.timestamps
    end
  end
end
