#!/usr/bin/env bash

set -xe

wget -q https://binaries.cockroachdb.com/cockroach-v2.1.1.linux-amd64.tgz

tar xzf cockroach-v2.1.1.linux-amd64.tgz

cp -i cockroach-v2.1.1.linux-amd64/cockroach /usr/local/bin