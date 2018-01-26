class CreateRegisteredApplications < ActiveRecord::Migration[5.1]
  def change
    create_table :registered_applications do |t|
      t.string :url
      t.string :name
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
