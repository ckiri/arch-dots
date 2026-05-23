#!/bin/sh
search_engine="https://duckduckgo.com/?t=ffab&q="

query=$(printf "\n" | wmenu -S "#222222" -p "Search the Web:")
test ! -n "${query}" && exit 1

$BROWSER "${search_engine}${query}"
