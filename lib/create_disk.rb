class CreateDisk
  def create_disk_fun(access_token, secret, name)
    puts "I am into create disk function........"
    puts access_token
    puts secret
    puts name
    puts "I am into create disk function........"
    connection = Fog::Storage.new({ :provider => 'AWS', :aws_access_key_id => access_token, :aws_secret_access_key => secret})
    directory = connection.directories.create(:key => "#{name}", :public => true)
  end
end