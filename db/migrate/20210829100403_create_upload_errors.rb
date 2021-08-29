class CreateUploadErrors < ActiveRecord::Migration[6.0]
  def change
    create_table :upload_errors do |t|
      t.text :details
      t.integer :upload_row
      t.references :contact_upload, null: false, foreign_key: true

      t.timestamps
    end
  end
end
