#!/usr/bin/env bash

for i in {1..13}; do sudo killall -HUP mDNSResponder; echo "flushed ${i} times"; done

