Basic Rails Docker Setup
========================

Making this cause I look at too many rails packages and have to setup a docker compose to run them (hah rvm)

> Inspiration: https://docs.docker.com/compose/rails/

> Note: May need to delete `tmp/pids/server.pid` every now and then

Setup
-----
1. Copy Dockerfile + docker-compose.yml
2. Change the database.yml to have the db host
3. docker-compose exec web rake db:create && docker-compose exec web rake db:migrate && docker-compose exec web rake db:seed
4. You should be good to go?

