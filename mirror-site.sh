#!/bin/bash
# mirror-site.sh
# A script to mirror a website for offline viewing.

# --- Functions ---

# Show usage information
usage() {
    echo "Usage: $0 [options] <URL>"
    echo "Options:"
    echo "  -d, --dir <directory>   Specify the download directory."
    echo "  -h, --help              Show this help message."
}

# --- Main Script ---

# Check for wget
if ! command -v wget &> /dev/null; then
    echo "Error: wget is not installed. Please install it to continue." >&2
    exit 1
fi

# Parse command-line arguments
while [[ "$#" -gt 0 ]]; do
    case "$1" in
        -d|--dir)
            DOWNLOAD_DIR="$2"
            shift 2
            ;;
        -h|--help)
            usage
            exit 0
            ;;
        *)
            SITE_URL="$1"
            shift
            ;;
    esac
done

# If no URL is provided, prompt the user
if [[ -z "$SITE_URL" ]]; then
    read -rp "Enter the URL of the website to mirror (e.g., https://example.com): " SITE_URL
fi

# Validate the URL
if [[ ! "$SITE_URL" =~ ^https?:// ]]; then
    echo "Error: Please enter a valid URL starting with http or https." >&2
    exit 1
fi

# If no download directory is specified, use the domain name
if [[ -z "$DOWNLOAD_DIR" ]]; then
    DOWNLOAD_DIR=$(echo "$SITE_URL" | awk -F/ '{print $3}')
fi

# Create the download directory if it doesn't exist
mkdir -p "$DOWNLOAD_DIR"

# --- Download ---

echo "📡 Mirroring website: $SITE_URL"
echo "📂 Saving to directory: $DOWNLOAD_DIR"

wget --mirror \
     --convert-links \
     --adjust-extension \
     --page-requisites \
     --no-parent \
     --quiet \
     --show-progress \
     -P "$DOWNLOAD_DIR" \
     "$SITE_URL"

# --- Completion ---

echo "✅ Website mirrored successfully!"
echo "⚡ You can now browse the offline copy in the '$DOWNLOAD_DIR' directory."

