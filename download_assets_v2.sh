#!/bin/bash
base_url="https://wpriverthemes.com/HTML/jayden/asset/images"
cd /Users/bpract/Desktop/Sinan/portfolio/jayden-v2/wpriverthemes.com/HTML/jayden

# Function to try downloading with multiple extensions
try_download() {
    local path=$1
    local name=$2
    shift 2
    local extensions=("$@")
    
    for ext in "${extensions[@]}"; do
        local url="$base_url/$path/$name.$ext"
        local status=$(curl -o /dev/null --silent --head --write-out '%{http_code}\n' "$url")
        if [ "$status" -eq 200 ]; then
            echo "Found $name.$ext"
            curl -s -o "asset/images/$path/$name.$ext" "$url"
            # Remove the html file if it exists
            rm "asset/images/$path/$name.html" 2>/dev/null
            return 0
        fi
    done
    echo "Failed to find $name with extensions: ${extensions[*]}"
    return 1
}

# Assets to check
try_download "section" "img-bg" "png" "jpg" "svg"
try_download "section" "quote" "png" "svg" "jpg"
try_download "section" "step1" "svg" "png" "jpg"
try_download "section" "step2" "svg" "png" "jpg"
try_download "section" "step3" "svg" "png" "jpg"
try_download "section" "step4" "svg" "png" "jpg"

try_download "avatar" "bg-avatar" "png" "jpg" "svg"

try_download "item" "loading" "gif" "png" "svg"
try_download "item" "close" "png" "svg" "gif"
try_download "item" "next" "png" "svg" "gif"
try_download "item" "prev" "png" "svg" "gif"
