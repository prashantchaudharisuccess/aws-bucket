CarrierWave.configure do |config|
    config.fog_credentials={
        :provider               =>'AWS',
        :aws_access_key_id      =>"AKIAIAL3W5DIRE2IUQLQ",
        :aws_secret_access_key  =>"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",
        :region                 =>"eu-west-1"
        
    }
    config.fog_directory='dappbucket'
end

