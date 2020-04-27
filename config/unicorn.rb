app_path          = "/root/projects/geofencing"
working_directory "#{app_path}"
pid               "#{app_path}/tmp/pids/unicorn.pid"
stderr_path       "#{app_path}/log/unicorn.log"
stdout_path       "#{app_path}/log/unicorn.log"

listen            "/tmp/unicorn.geofencing.sock"
worker_processes  1
timeout           600
preload_app       true
