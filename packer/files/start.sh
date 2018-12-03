#!/usr/bin/env bash

IP=`hostname -I | cut -d' ' -f2`

cockroach start --insecure --store=node1 --listen-addr=${IP}