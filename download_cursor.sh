#!/bin/bash
base_url="https://wpriverthemes.com/HTML/jayden/asset/icons"
cd /Users/bpract/Desktop/Sinan/portfolio/jayden-v2/wpriverthemes.com/HTML/jayden

# Function to try downloading with multiple extensions
try_download() {
    local path=$1
    local name=$2
    shift 2
    local extensions=("$@")
    
    for ext in "${extensions[@]}"; do
        local url="$base_url/$name.$ext"
        local status=$(curl -o /dev/null --silent --head --write-out '%{http_code}\n' "$url")
        if [ "$status" -eq 200 ]; then
            echo "Found $name.$ext"
            curl -s -o "asset/icons/$name.$ext" "$url"
            rm "asset/icons/$name.html" 2>/dev/null
            return 0
        fi
    done
    echo "Failed to find $name with extensions: ${extensions[*]}"
    return 1
}

# Assets to check
try_download "" "cursor-close" "png" "svg" "jpg" "gif" "cur"
