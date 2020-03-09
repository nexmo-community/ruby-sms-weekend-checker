class CreateDiffStorages < ActiveRecord::Migration[6.0]
  def change
    create_table :diff_storages do |t|
      t.text :website_data

      t.timestamps
    end
  end
end
