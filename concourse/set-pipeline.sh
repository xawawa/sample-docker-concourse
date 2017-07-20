#!/bin/sh
fly -t xawawa set-pipeline -p acceptance-test-pipeline -c ./pipeline.yml
