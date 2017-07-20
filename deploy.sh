#!/usr/bin/env bash
set -o errexit #abort if any command fails
bundle exec middleman build --clean
aws s3 sync --delete build s3://docs.lang.ai
