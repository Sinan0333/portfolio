#!/bin/bash
base_url="https://wpriverthemes.com/HTML/jayden/asset/images"
cd /Users/bpract/Desktop/Sinan/portfolio/jayden-v2/wpriverthemes.com/HTML/jayden

# Function to try downloading
try_download() {
    local path=$1
    local name=$2
    local ext=$3
    local url="$base_url/$path/$name.$ext"
    local status=$(curl -o /dev/null --silent --head --write-out '%{http_code}\n' "$url")
    if [ "$status" -eq 200 ]; then
        echo "Found $name.$ext"
        curl -s -o "asset/images/$path/$name.$ext" "$url"
        rm "asset/images/$path/$name.html" 2>/dev/null
    else
        echo "Not found $name.$ext"
    fi
}

try_download "section" "img-bg" "png"
try_download "section" "quote" "png"
try_download "section" "step1" "png"
try_download "section" "step2" "png"
try_download "section" "step3" "png"
try_download "section" "step4" "png"

try_download "avatar" "bg-avatar" "png"

try_download "item" "loading" "gif"
try_download "item" "close" "gif"
try_download "item" "close" "png"
try_download "item" "next" "png"
try_download "item" "prev" "png"
