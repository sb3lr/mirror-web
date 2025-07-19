
# Mirror Website Script

This repository contains a simple Bash script to download a full mirror of any website for offline viewing. It uses the `wget` command with useful options to ensure that all linked pages and resources are saved locally.

---

## Script Breakdown

```bash
#!/bin/bash

echo "📡 جاري تحميل ..."

wget --mirror \
     --convert-links \
     --adjust-extension \
     --page-requisites \
     --no-parent \
     https://example.com/

echo "✅ تم تحميل الموقع بالكامل!"
echo "📁 افتح المجلد:  وابدأ التصفح بدون إنترنت"
```

- `#!/bin/bash`  
  This line tells the system to use Bash shell to execute the script.

- `echo "📡 جاري تحميل ..."`  
  Prints a message indicating that the download is starting.

- `wget --mirror \`  
  The `--mirror` option enables options suitable for mirroring a website (recursive download, timestamping, etc.).

- `--convert-links \`  
  Converts the links in the downloaded files to be suitable for local viewing.

- `--adjust-extension \`  
  Ensures proper file extensions (.html, etc.) are added to files.

- `--page-requisites \`  
  Downloads all the assets (images, CSS, JS) needed to properly display the pages offline.

- `--no-parent \`  
  Prevents downloading files from parent directories of the specified URL.

- `https://lostsec.xyz/`  
  The URL of the website to mirror. Replace this URL with any website you want to download.

- `echo "✅ تم تحميل الموقع بالكامل!"`  
  Prints a message that the download is complete.

- `echo "📁 افتح المجلد:  وابدأ التصفح بدون إنترنت"`  
  Reminder to open the downloaded folder and start browsing offline.

---

## How to Use

1. Make sure `wget` is installed on your system.  
   On Debian/Ubuntu: `sudo apt-get install wget`  
   On CentOS/RHEL: `sudo yum install wget`

2. Save the script to a file, e.g., `mirror-site.sh`.

3. Make the script executable:  
   ```bash
   chmod +x mirror-site.sh
   ```

4. Run the script and pass the target URL as an argument:  
   ```bash
   ./mirror-site.sh https://example.com
   ```

---

## warning

This script is intended for educational and personal offline use only.  
**Always respect website terms of service and robots.txt restrictions before downloading or mirroring any website.**  
Do not use this script to download websites without proper permission or for any illegal activity.  

The author is not responsible for any misuse of this script.

---

