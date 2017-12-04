class BucketFile < ApplicationRecord
	mount_uploader :attachment, AttachmentUploader
	require 'rubygems'
	require 'fog'
end
