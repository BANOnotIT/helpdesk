#!/usr/bin/env bash

docker run --rm --volume="$PWD:/srv/jekyll" --volume="$PWD/.tmp/:/usr/local/bundle" -p 4000:4000 -it jekyll/jekyll jekyll serve
