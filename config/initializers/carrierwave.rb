CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',       # required
<<<<<<< HEAD
    :aws_access_key_id      => 'AWS_ACCESS_KEY_ID',       # required
    :aws_secret_access_key  => 'AWS_SECRET_ACCESS_KEY',       # required
=======
    :aws_access_key_id      => ENV['AWS_ACCESS_KEY_ID'],       # required
    :aws_secret_access_key  => ENV['AWS_SECRET_ACCESS_KEY'],       # required
>>>>>>> origin/master
    :region                 => 'us-west-2',  # optional, defaults to 'us-east-1'
   # :host                   => 'https://s3.amazonaws.com', 
    #:endpoint               => 'sethmile.s3-website-us-west-2.amazonaws.com'
  }
  config.fog_directory  = 'sethmile'                     # required
  config.fog_public     = true                                   # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end