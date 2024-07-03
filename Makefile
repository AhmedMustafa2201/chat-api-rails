include .envs/.db

migrate:
	docker exec -it chat_local_api bin/rails db:migrate
db_connect:
	docker exec -it chat_local_db mysql -u${MYSQL_USER} -p${MYSQL_PASSWORD}
run_swagger:
	docker exec -it chat_local_api bin/rails rswag:specs:swaggerize
unittest_controllers:
	docker exec -it chat_local_api bundle exec rspec spec/controllers
