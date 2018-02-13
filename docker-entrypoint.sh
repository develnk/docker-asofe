#!/bin/bash
set -e

asofe-fetch-params

exec "$@"
