class FileUploader < Shrine
  Attacher.validate do
    validate_mime_type_inclusion ["text/csv", "application/octet-stream", "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"]
  end
end
