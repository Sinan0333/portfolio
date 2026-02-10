#!/bin/bash
base_url="https://wpriverthemes.com/HTML/jayden/asset/js"
cd /Users/bpract/Desktop/Sinan/portfolio/jayden-v2/wpriverthemes.com/HTML/jayden

# Function to try downloading
try_download() {
    local name=$1
    local url="$base_url/$name"
    local status=$(curl -o /dev/null --silent --head --write-out '%{http_code}\n' "$url")
    if [ "$status" -eq 200 ]; then
        echo "Found $name"
        curl -s -o "asset/js/$name" "$url"
        return 0
    else
        echo "Not found $name"
        return 1
    fi
}

try_download "main.js"
try_download "lightbox.min.js"
