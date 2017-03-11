#!/bin/sh

set -e


[ -z "${GITHUB_PAT}" ] && exit 0
echo "TEST1"
[ "${TRAVIS_BRANCH}" != "source" ] && exit 0
echo "TEST2"


git config --global user.email "akira00120@gmail.com"
git config --global user.name "Akira Matsui "

echo https://${GITHUB_PAT}@github.com/${TRAVIS_REPO_SLUG}.git site-output
git clone -b master https://${GITHUB_PAT}@github.com/${TRAVIS_REPO_SLUG}.git site-output
cd site-output
cp -r ../public/* ./
git add --all *
git commit -m　"Update the site" || true
git push -q origin master
