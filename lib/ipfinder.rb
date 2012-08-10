
class IPFinder

  def self.find_all(file)
    iphash = {}
    begin
      File.open(file, 'r').each do |line|
        IPFinder.find(line).each do |ip|
          if iphash[ip]
            iphash[ip] += 1
          else
            iphash[ip] = 1
          end
        end
      end
    rescue
      warn "Unable to open file: #{file}"
    end
    iphash
  end

  def self.find(string)
    string.scan(/\b(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\b/).uniq
  end

end

if __FILE__ == $0
  string = './httpd/access:127.0.0.1 - sample [07/Aug/2012:10:06:55 -0500] "GET /sample/index.html HTTP/1.1" 404 304 "-" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.5; rv:14.0) Gecko/20100101 Firefox/14.0.1"'

  p IPFinder.find(string)
end
