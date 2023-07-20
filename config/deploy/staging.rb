set :stage, :staging
set :rails_env, :staging
set :rack_env, :staging
set :branch, 'main'
set :deploy_to, '/home/ubuntu/anki-web'

server "52.221.98.137", user: "ubuntu", roles: %w(web app db)