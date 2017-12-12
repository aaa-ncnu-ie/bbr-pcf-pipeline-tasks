#!/usr/bin/env ruby
require 'aws-sdk-s3'
s3 = Aws::S3::Resource.new(
  :access_key_id => "#{ENV['storage-access-key-id']}",
  :secret_access_key => "#{ENV['storage-secret-access-key']}",
  :region => 'us-east-1'
)

file = "#{ENV['backup_file_name']}"
bucket = "#{ENV['backup-artifact-bucket']}"
print "uploading file to S3 #{bucket} - "
puts File.size(file)

name = File.basename(file)

obj = s3.bucket(bucket).object(name)

obj.upload_file(file)

File.delete(file)

puts "Finished Upload of #{file} to S3 #{bucket}"
