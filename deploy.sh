#!/usr/bin/env bash
set -o errexit #abort if any command fails
bundle exec middleman build --clean
aws s3 sync --delete --region=eu-central-1 build s3://docs.lang.ai
