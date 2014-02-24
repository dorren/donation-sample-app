# ------------------------------------------------------------------------------
# Sample rails 3 config
# from https://github.com/dtaniwaki/capistrano-unicorn/blob/master/examples/rails3.rb
# ------------------------------------------------------------------------------

app_path = File.expand_path('../', File.dirname(__FILE__))  # returns app's current dir

# Set unicorn options
worker_processes 1
preload_app true
timeout 180
#listen "127.0.0.1:9000"
listen "#{app_path}/tmp/unicorn.sock"

# Fill path to your app
working_directory app_path

# Should be 'production' by default, otherwise use other env 
rails_env = ENV['RAILS_ENV'] || 'production'

# Log everything to one file
stderr_path "log/unicorn.log"
stdout_path "log/unicorn.log"

# Set master PID location
pid "#{app_path}/tmp/pids/unicorn.pid"

before_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection
end
