require "shrine"
require "shrine/storage/file_system"
require "shrine/storage/memory"
require "shrine/storage/s3"
Shrine.storages = if Rails.env.test?
                    {
                      cache: Shrine::Storage::Memory.new,
                      store: Shrine::Storage::Memory.new
                    }
                  elsif Rails.env.development?
                    {
                      cache: Shrine::Storage::FileSystem.new("public", prefix: "uploads/cache"), # temporary
                      store: Shrine::Storage::FileSystem.new("public", prefix: "uploads") # permanent
                    }
                  else 
                    s3_options = {
                      access_key_id: ENV["AWS_ID"],
                      secret_access_key: ENV["AWS_SECRET"],
                      region: ENV["AWS_UPLOAD_REGION"],
                      bucket: ENV["AWS_BUCKET_NAME"]
                    }

                    Shrine.storages = {
                      cache: Shrine::Storage::S3.new(prefix: "cache", **s3_options), # temporary
                      store: Shrine::Storage::S3.new(**s3_options) # permanent
                    }

                  end
Shrine.plugin :activerecord # loads Active Record integration
Shrine.plugin :cached_attachment_data # enables retaining cached file across form redisplays
Shrine.plugin :restore_cached_data  # extracts metadata for assigned cached files
Shrine.plugin :validation_helpers
Shrine.plugin :validation
Shrine.plugin :determine_mime_type, analyzer: :marcel
