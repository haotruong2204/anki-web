set :stage, :production
set :rails_env, :production
set :rack_env, :production
set :branch, 'main'
set :deploy_to, '/home/ubuntu/anki-web'

server "52.221.98.137", user: "ubuntu", roles: %w(web app db)