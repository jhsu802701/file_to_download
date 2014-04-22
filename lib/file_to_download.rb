#!/usr/bin/env ruby
require "file_to_download/version"

class Filetodownload

  attr :path

  def initialize (path)
    @path = path
  end

  # Get size of file in bytes (0 if it does not exist)
  def size # in bytes
    begin
      output = File.stat(path).size
      return output
    rescue
      return 0
    end
  end

  # Get the age of a given file (in hours)
  # If the file is not found, return 4 billion (over 100,000 years).
  def age # In hours
    begin
      age_seconds = Time.now - File.mtime(path)
      age_hours = age_seconds/3600
      return age_hours
    rescue
      return 4E9
    end
  end

  # This condition determines whether to keep downloading
  # n_fail: current number of failed download attempts
  # n_fail_max: maximum number of failed download attempts to make before giving up
  # age_max_hrs: skip the downloaded unless the age of the file in hours exceeds this
  def conditionDownload (n_fail, n_fail_max, age_max_hrs)
    return false if n_fail >= n_fail_max
    return true if size == 0
    return true if age > age_max_hrs
    return false
  end

  # PURPOSE: downloads file from url, saves locally as filename
  # age_max: skip download unless existing file named filename has
  # reached the maximum age (hours)
  # t_delay: maximum delay in seconds following download, needed to 
  # minimize the impact on the upstream server
  
  # url: web address of the page to be downloaded
  # delay_max_sec: time delay before making the download (in seconds)
  def get (url, n_fail_max, age_max_hrs, delay_max_sec)
    require "open-uri"
    # Number of failures to download file
    n_fail = 0
    # Download new file ONLY if the file size is 0 or is too old
    # and ONLY if there have been fewer than 4 failures
    while conditionDownload(n_fail, n_fail_max, age_max_hrs) == true
      begin
        open(path, 'w') do |fo|
          fo.write open(url).read
        end
        # Delay of .5*delay_max_sec to 1*delay_max_sex
        t = rand (delay_max_sec/2 .. delay_max_sec)
        sleep (t) 
      rescue
        n_fail += 1
        puts ("Failure #{n_fail}/#{n_fail_max} #{url}")
        puts ("Download failed, giving up") if n_fail > n_fail_max
      end
    end
  end
  
  def delete
    system ("rm #{path}")
  end

end