#!/usr/bin/env ruby
require 'aws-sdk-s3'
s3 = Aws::S3::Resource.new(
  :access_key_id => "#{ENV['storage-access-key-id']}",
  :secret_access_key => "#{ENV['storage-secret-access-key']}",
  :region => 'us-east-1'
)

file = "#{ENV['backup_file_name']}"
bucket = "#{ENV['backup-artifact-bucket']}"

name = File.basename(file)

obj = s3.bucket(bucket).object(name)

obj.upload_file(file)

#File.delete(file)
