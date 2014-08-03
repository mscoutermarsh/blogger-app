# Uses FOLLOWER_DATABASE_URL
# to configure a follower DB for octopus
require 'uri'

if %w{production staging}.include? Rails.env
  follower_url = ENV['FOLLOWER_DATABASE_URL']

  begin
    url = URI.parse(follower_url)
  rescue URI::InvalidURIError
    raise "Invalid FOLLOWER_DATABASE_URL"
  end

  Octopus.setup do |config|
    config.environments = [:production, :staging]
    config.shards = {read_only:
                     {adapter: 'postgresql',
                      database: url.path.split('/').last,
                      username: url.user,
                      host: url.host,
                      port: url.port,
                      password: url.password}
    }
  end
end
