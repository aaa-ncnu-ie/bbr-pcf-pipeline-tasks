#!/usr/bin/env ruby
require 'aws-sdk-s3'

def filesize(size)
  units = ['B', 'KiB', 'MiB', 'GiB', 'TiB', 'Pib', 'EiB']

  return '0.0 B' if size == 0
  exp = (Math.log(size) / Math.log(1024)).to_i
  exp = 6 if exp > 6

  '%.1f %s' % [size.to_f / 1024 ** exp, units[exp]]
end


s3 = Aws::S3::Resource.new(
  :access_key_id => "#{ENV['storage-access-key-id']}",
  :secret_access_key => "#{ENV['storage-secret-access-key']}",
  :region => 'us-east-1'
)

file = "#{ENV['backup_file_name']}"
bucket = "#{ENV['backup-artifact-bucket']}"
puts Time.now
print "uploading file to S3 #{bucket} - "

upload_size = File.size(file)
puts filesize(upload_size)

name = File.basename(file)

obj = s3.bucket(bucket).object(name)

obj.upload_file(file)

File.delete(file)

puts Time.now
puts "Finished Upload of #{file} to S3 #{bucket}"
