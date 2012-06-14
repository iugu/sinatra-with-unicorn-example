# worker_processes 128
timeout 10
preload_app true

apppath = '/home/patrick/Desenvolvimento/unicorn-test'

if GC.respond_to?(:copy_on_write_friendly=)
  GC.copy_on_write_friendly = true
end
#listen '/tmp/unicorn.sock', :backlog => 2048

after_fork do |server, worker|

end

before_exec do |server|
  ENV['BUNDLE_GEMFILE'] = "#{apppath}/current/Gemfile"
end
