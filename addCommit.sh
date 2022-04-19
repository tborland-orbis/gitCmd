#!/bin/bash
git add . 
git commit .
git status

git log --pretty=format:"%h - %an, %ar : %s"
