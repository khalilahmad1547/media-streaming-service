class CreateUploads < ActiveRecord::Migration[7.0]
  def change
    create_table :uploads do |t|
      t.belongs_to :movie, forgin_key: true
      t.belongs_to :user, forgin_key: true
      t.timestamps
    end
  end
end
