# FileToDownload

This Ruby Gem is used for the process of downloading a file and saving it on the local drive.

This gem can obtain the age and size of a file.

You can conditionally download a remote file and save a local copy.  The download parameters are:
1. URL of the remote file
2. Maximum number of download attempts
3. Maximum age of a file (in hours)
4. Maximum delay after attempting the download (in seconds)

## Commands for Testing
1. git clone https://github.com/jhsu802701/file_to_download.git
2. cd file_to_download
3. gem install rspec
4. rake 

## Installation

Add this line to your application's Gemfile:

    gem 'file_to_download'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install file_to_download

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it ( https://github.com/[my-github-username]/file_to_download/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
