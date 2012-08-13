require 'test/unit'
require 'ipfinder'

class IPFinderTest < Test::Unit::TestCase
  def test_find
    string = '/logs/apache2/20120809:127.0.0.1 - - [13/Aug/2012:09:47:18 -0500] "GET /favicon.ico HTTP/1.1" 404 209 "-" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_0) AppleWebKit/537.1 (KHTML, like Gecko) Chrome/21.0.1180.75 Safari/537.1"'
    assert_equal ["127.0.0.1"], IPFinder.find(string)
  end

  def test_find_all
    file = 'test/example.log'
    iphash = IPFinder.find_all(file)
    assert_equal 3, iphash.keys.length
    assert_equal 7, iphash['127.0.0.1']
    assert_equal 5, iphash['192.168.1.25']
    assert_equal 6, iphash['10.168.1.100']
  end
end
