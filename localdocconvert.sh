# converts docs to html
#!/bin/bash

# Define relative paths
SOURCE_DIR_REL="docops"
OUTPUT_DIR_REL="target/docs"

# Get absolute paths
SOURCE_DIR=$(realpath "$SOURCE_DIR_REL")
OUTPUT_DIR=$(realpath "$OUTPUT_DIR_REL" 2>/dev/null || echo "$(pwd)/$OUTPUT_DIR_REL")

# Create output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

echo "Source directory: $SOURCE_DIR"
echo "Output directory: $OUTPUT_DIR"

create_dir_if_not_exists() {
    if [ ! -d "$1" ]; then
        mkdir -p "$1"
        echo "Created directory: $1"
    else
        echo "Directory already exists: $1"
    fi
}
# Usage
create_dir_if_not_exists "out"

curl -X GET --location "http://127.0.0.1:7202/converter/api/test?sourceDir=$SOURCE_DIR&outputDir=$OUTPUT_DIR" -o out/results.html