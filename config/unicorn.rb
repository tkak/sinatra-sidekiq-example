@dir = "/opt/sinatra-sidekiq-example"

worker_processes 1

timeout 30

stderr_path "#{@dir}/log/unicorn.stderr.log"
stdout_path "#{@dir}/log/unicorn.stdout.log"
