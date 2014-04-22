# FileToDownload

## Purpose
This Ruby Gem is used for the process of downloading a file and saving it on the local drive.

This gem can obtain the age and size of a file.

You can conditionally download a remote file and save a local copy.  

## Commands for development
1. git clone https://github.com/jhsu802701/file_to_download.git
2. cd file_to_download
3. gem install rspec
4. rake # runs tests
5. rake install # installs this gem

## Installation

Add this line to your application's Gemfile:

    gem 'file_to_download'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install file_to_download

## Usage

ftd = Filetodownload.new("file_path") &#35; Initialize path name of file

ftd.size &#35; Gets size of file in bytes

ftd.age &#35; Gets age of file in hours

&#35; Download web page and save it to the above file path

&#35; Give up after 4 failed attempts

&#35; Keep the existing file if it's no more than 1.0 hours old

&#35; Pause for up to 0.5 seconds after the download

ftd.get("http://finance.yahoo.com/q/pr?s=BRK-B+Profile", 4, 1.0, 0.5)

## Contributing

1. Fork it ( https://github.com/[my-github-username]/file_to_download/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
