require 'uri'

class CookieUnencryptor
  attr_reader :content

  def initialize(content)
    @content = content
  end

  def call
    unescaped_content = URI.unescape(content)
    data, digest = unescaped_content.split('--')
    Marshal.load(::Base64.decode64(data))
  end
end
