worker_processes Integer(ENV['WEB_CONCURRENCY'] || 3)

# kill long running requests. Default: 15 seconds
# Heroku's default is 30 seconds.
timeout Integer(ENV['WEB_TIMEOUT'] || 15)
preload_app true

before_fork do |server, worker|

  Signal.trap 'TERM' do
    puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
    Process.kill 'QUIT', Process.pid
  end

  if defined?(ActiveRecord::Base)
    shards = ActiveRecord::Base.connection_proxy.instance_variable_get(:@shards)

    shards.each do |shard, connection_pool|
      connection_pool.disconnect!
    end

    ActiveRecord::Base.connection.disconnect!
  end
end

after_fork do |server, worker|

  Signal.trap 'TERM' do
    puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to sent QUIT'
  end

  Octopus.config['production']['master'] = ActiveRecord::Base.connection.config
  ActiveRecord::Base.connection.initialize_shards(Octopus.config)
end
