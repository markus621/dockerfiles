#!/usr/bin/env bash

fn_loop() {
    for (( ; ; ))
    do
       sleep 5s
    done
}

cd /app && go mod tidy && fn_loop


