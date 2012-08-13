class IPFinder

  def self.find_all(file)
    iphash = Hash.new(0)
    begin
      File.open(file, 'r').each do |line|
        IPFinder.find(line).each do |ip|
          iphash[ip] += 1
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
