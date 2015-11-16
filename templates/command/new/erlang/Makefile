PROJECT = <%= project_name %>

DEPS = wok wok_message_handler 
dep_wok = git https://github.com/botsunit/wok.git master
dep_wok_message_handler = git https://github.com/botsunit/wok_message_handler.git master

include erlang.mk

dev: deps app
	@erl -pa ebin include deps/*/ebin deps/*/include -config config/<%= project_name %>.config

