set :user, 'martin'
set :branch, 'master'
server "www.martin-blog.com", :app, :web, :db, primary: true
set :deploy_to, "/var/www/wedding_celebration"
