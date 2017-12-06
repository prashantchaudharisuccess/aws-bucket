class BucketFilesController < ApplicationController
  before_action :set_user
  require 'move_file'
  # Function to select the disk
  def disk_file_upload
  	@bucket_size = 0
  	@bucket_files = BucketFile.new
  	@current_disk_id = params[:disk_id]
  	@bucket_name = params[:name]
  	connection = Fog::Storage.new({ :provider => 'AWS', :aws_access_key_id => "AKIAIAL3W5DIRE2IUQLQ", :aws_secret_access_key => "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"})
    directory = connection.directories.get("#{params[:name]}")
    @files = directory.files
    puts "-----++++++++++==============="
    puts @files.inspect
    puts "-----++++++++++==============="
  end

  def create
    puts "========================"
    puts params[:bucket_file]
    puts "========================"
  	connection = Fog::Storage.new({ :provider => 'AWS', :aws_access_key_id => "AKIAIAL3W5DIRE2IUQLQ", :aws_secret_access_key => "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"})
    directory = connection.directories.get("#{params[:bucket_file][:disk_name]}")
  	@bucket_files = BucketFile.new(bucket_files_params)
  	@bucket_files.save
  	file = directory.files.create(
  		:key    => "#{@bucket_files.attachment.identifier}",
  		:body   => File.open("#{@bucket_files.attachment.current_path}"),
  		:public => true
	   )

	   respond_to do |format|
        format.html { redirect_to disk_file_upload_path(params[:bucket_file][:disk_id], params[:bucket_file][:disk_name]), notice: 'File was successfully created.' }
    end
  end

  def move_file_form
    @bucket_name = params[:disk_name]
    @file_name = params[:file_name]
    @user_disk = Disk.where(:user_id => @current_user.id)
    puts "I am into move file function........."
  end

  def file_move
    puts params[:disk_name]
    puts params[:file_move_path][:to_bucket]
    puts params[:file_name]
    file = ::MoveFile.new
    file.move_file_fun("AKIAIAL3W5DIRE2IUQLQ", "DwGPiZDSAgV6wYKleM0b9HCV7cMH3xiPJzYd", params[:disk_name], params[:file_name], params[:file_move_path][:to_bucket], params[:file_name])
    # connection = Fog::Storage.new({ :provider => 'AWS', :aws_access_key_id => "AKIAIAL3W5DIRE2IUQLQ", :aws_secret_access_key => "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"})
    # connection.copy_object(params[:disk_name], params[:file_name], params[:file_move_path][:to_bucket], params[:file_name])
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def bucket_files_params
      params.require(:bucket_file).permit(:attachment, :user_id, :disk_id)
    end

    def set_user
      @current_user = current_user
    end
end
