#!/usr/bin/env ruby

# GENERAL DIRECTORIES
ENV["DIR_MAIN"] = File.expand_path("../../../", __FILE__)
ENV["DIR_MAIN_SCRIPTS"] = "#{ENV["DIR_MAIN"]}/lib"

# TEST MODE
ENV["DIR_SPEC"] = "#{ENV["DIR_MAIN"]}/spec"
ENV["DIR_SPEC_WRITE"] = "#{ENV["DIR_SPEC"]}/write"
ENV["DIR_SPEC_READ"] = "#{ENV["DIR_SPEC"]}/read"

puts "Main directory: #{ENV["DIR_MAIN"]}"

puts "Test directory: #{ENV["DIR_SPEC"]}"
puts "Test write directory: #{ENV["DIR_SPEC_WRITE"]}"
puts "Test read directory: #{ENV["DIR_SPEC_READ"]}"

require "#{ENV['DIR_MAIN_SCRIPTS']}/file_to_download"

describe Filetodownload do
  file_to_read = Filetodownload.new ("#{ENV["DIR_SPEC_READ"]}/test.txt")
  file_to_read.size.should == 50

  file_to_read = Filetodownload.new ("#{ENV["DIR_SPEC_READ"]}/doesnotexist.txt")
  file_to_read.size.should == 0
  file_to_read.age.should == 4E9

  
  file_to_write = Filetodownload.new ("#{ENV["DIR_SPEC_WRITE"]}/brkb.html")
  file_to_write.delete
  url_brkb = "http://finance.yahoo.com/q/pr?s=BRK-B+Profile"
  file_to_write.get(url_brkb, 4, 1.0, 0.5)
  file_to_write.age.should > 0.2/3600.0
  file_to_write.age.should < 10.0/3600.0
  file_to_write.size.should > 1E4

end