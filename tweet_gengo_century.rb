# refer to https://qiita.com/takano-h/items/271cbe242eae2f3f02c2
# https://developer.twitter.com/en/docs/twitter-api/v1/tweets/post-and-engage/api-reference/post-statuses-update

require 'net/https'
require 'securerandom'
require 'erb'
require 'base64'

class TwitterService
  TWITTER_API_DOMAIN          = "https://api.twitter.com"
  TWITTER_STATUS_UPDATE_ENDPOINT  = "#{TWITTER_API_DOMAIN}/1.1/statuses/update.json"
  TWITTER_SIGNATURE_METHOD    = "HMAC-SHA1"
  TWITTER_OAUTH_VERSION       = "1.0"
  TWITTER_CONSUMER_KEY        = "3LJebEs2xsXvD7prs6soOTSXJ"
  TWITTER_CONSUMER_SECRET     = "OuI3wo0fX4C0793W4p9K2oxiUjIeIaEVCzqG0VGA52vXwyhG9d"
  TWITTER_ACCESS_TOKEN        = "1342037025394814976-W2FSSqO415KD58zWO0NF0GlTThZyMt"
  TWITTER_ACCESS_TOKEN_SECRET = "qUi78FapoylnHeR2Y0By4ccgr6dc6Mnps1J2tqd5LFbgP"

  def self.tweet_text(text)
    uri = URI.parse(TWITTER_STATUS_UPDATE_ENDPOINT)

    request = Net::HTTP::Post.new(uri)
    request.content_type = "application/json"
    request.set_form_data({"status" => text})

    request["Authorization"] = authorization_value
    options = { use_ssl: true }

    response = Net::HTTP.start(uri.hostname, uri.port, options) do |http|
      http.request(request)
    end
    p response
  end

  private

  def self.authorization_value
    authorization_params = signature_params.merge(
      oauth_signature: generate_signature("POST", TWITTER_STATUS_UPDATE_ENDPOINT)
    )
    return "OAuth " + authorization_params.sort.map{|k, v| "#{k}=\"#{v}\"" }.join(",")
  end

  def self.signature_params
    @signature_params ||= {
      oauth_consumer_key: TWITTER_CONSUMER_KEY,
      oauth_nonce: SecureRandom.uuid,
      oauth_signature_method: TWITTER_SIGNATURE_METHOD,
      oauth_timestamp: Time.now.to_i,
      oauth_token: TWITTER_ACCESS_TOKEN,
      oauth_version: TWITTER_OAUTH_VERSION
    }
  end

  def self.oauth_values
    values = signature_params.sort.map {|k, v| "#{k}=#{v}" }.join("&")
    ERB::Util.url_encode(values)
  end

  def self.generate_signature(method, url)
    signature_data = [method, ERB::Util.url_encode(url), oauth_values].join("&")
    signature_key = "#{ERB::Util.url_encode(TWITTER_CONSUMER_SECRET)}&#{ERB::Util.url_encode(TWITTER_ACCESS_TOKEN_SECRET)}"
    signature_binary = OpenSSL::HMAC.digest(OpenSSL::Digest::SHA1.new, signature_key, signature_data)
    ERB::Util.url_encode(Base64.strict_encode64(signature_binary))
  end
end

if $0 == __FILE__
  TwitterService.tweet_text("test")
end
