class CreateContactUploads < ActiveRecord::Migration[6.0]
  def change
    create_table :contact_uploads do |t|
      t.jsonb :file_data
      t.string :status
      t.jsonb :data_columns
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
