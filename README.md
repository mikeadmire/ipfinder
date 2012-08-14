# IPFinder gem

This is a gem that can be used to pull IP addresses out of files and strings.

There are two public class methods available:

- IPFinder.find_all

- IPFinder.find

## IPFinder.find_all()

Pass it a file and it will return a hash of IP addresses and the number of times they
occur in the file. IP addresses are the keys and the number of times they appear in a
file are the values. It will only count an IP address once per line. 

## IPFinder.find()

Pass it a string and it will return an array of all unique IP addresses found in that
string.

Example:

    #!/usr/bin/env ruby
    # look for IP addresses from one file in another and print the lines they appear

    require 'ipfinder'

    ip_addresses = IPFinder.find_all('/file/with/ip_addresses').keys
    File.open('xferlog', 'r').each do |line|
      IPFinder.find(line).each do |ip|
        puts line if ip_addresses.include?(ip)
      end
    end

