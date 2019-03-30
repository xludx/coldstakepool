#!/bin/sh
set -e

pwd
ls -al

# init
if [ "$1" = 'init' ]; then
    set -- coldstakepool-prepare -datadir=~/data/stakepool-testnet -testnet "$@"
fi

# start
#if [ "$1" = 'start' ]; then
#    if [ ! -f /app/laravel-echo-server.json ]; then
#        cp /etc/laravel-echo-server.json /app/laravel-echo-server.json
#        # Replace with environment variables
#        sed -i "s|LARAVEL_ECHO_SERVER_DB|${LARAVEL_ECHO_SERVER_DB:-redis}|i" /app/laravel-echo-server.json
#        sed -i "s|REDIS_HOST|${REDIS_HOST:-redis}|i" /app/laravel-echo-server.json
#        sed -i "s|REDIS_PORT|${REDIS_PORT:-6379}|i" /app/laravel-echo-server.json
#        sed -i "s|REDIS_PASSWORD|${REDIS_PASSWORD:-password}|i" /app/laravel-echo-server.json
#    fi
#    set -- laravel-echo-server "$@"
#fi

# first arg is `-f` or `--some-option`
#if [ "${1#-}" != "$1" ]; then
#	set -- laravel-echo-server "$@"
#fi

exec "$@" --force
