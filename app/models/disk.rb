class Disk < ApplicationRecord
    # mount_uploader :attachment, AttachmentUploader
	  require 'rubygems'
	  require 'fog'
    
    # This methods calculates the number space occupied by uploading files.
    def self.calculate_disk_size(disk_id)
    	size = 0
    	AWS::S3::Bucket.objects.each do |object| #object should be an S3Object
  			# if object.metadata(name) =~ /user//:id//files/
  			puts "+++++++++ Object +++++++++++"
  			puts object.inspect
  			puts object.content_length
  			puts "+++++++++ Object +++++++++++"
    			size += object.content_length #in bytes
  			# end
		end
    end

    def self.create_directory(name)
      puts "===================="
      connection = Fog::Storage.new({ :provider => 'AWS', :aws_access_key_id => "AKIAIAL3W5DIRE2IUQLQ", :aws_secret_access_key => "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"})
    	directory = connection.directories.create(:key => "#{name}", :public => true)
    end
end
