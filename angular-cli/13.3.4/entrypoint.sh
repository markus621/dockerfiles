#!/usr/bin/env bash

cd /data && yarn install --ignore-scripts --audit --frozen-lockfile && yarn run start