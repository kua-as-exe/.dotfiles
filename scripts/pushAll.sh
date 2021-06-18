#!/bin/bash

commitMsg=$1

git add .
git commit -m "$commitMsg"
git push
