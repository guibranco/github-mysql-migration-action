#!/bin/sh -l

echo "Executin $1 in $2 with user $3 in database $4"
time=$(date)
echo "time=$time" >> $GITHUB_OUTPUT
