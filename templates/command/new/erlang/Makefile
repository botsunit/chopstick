PROJECT = <%= bot_name %>

DEPS = wok wok_erlang_templates
dep_wok = git git@gitlab.botsunit.com:msaas/wok.git master
dep_wok_erlang_templates = git git@gitlab.botsunit.com:msaas/wok_erlang_templates.git master

DEP_PLUGINS = wok_erlang_templates

TMPL_OPTS = {libraries, [{wok_helpers, wok_helpers_dtl}]} \
            , {default_libraries, [wok_helpers]} \
            , report_warnings \
            , report_errors

include erlang.mk

dev: deps app
	@erl -pa ebin include deps/*/ebin deps/*/include -config config/<%= bot_name %>.config

