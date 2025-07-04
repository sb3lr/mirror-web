#!/bin/bash
# download-site.sh
# سكربت بسيط لأرشفة أي موقع كاملًا للعمل بدون إنترنت

# إذا تم تمرير رابط كوسيط أول نستعمله، وإلا نطلبه من المستخدم
if [[ -n "$1" ]]; then
    SITE_URL="$1"
else
    read -rp "أدخل رابط الموقع (مثال: https://example.com): " SITE_URL
fi

# تأكيد أن الرابط يبدأ بـ http
if [[ ! "$SITE_URL" =~ ^https?:// ]]; then
    echo "❌ ‏الرجاء إدخال رابط يبدأ بـ http أو https"
    exit 1
fi

# نحصل على الدومين فقط لإنشاء مجلد مرتب
DOMAIN=$(echo "$SITE_URL" | awk -F/ '{print $3}')

echo "📡 جاري تحميل الموقع: $SITE_URL ..."
echo "🗂️ سيتم الحفظ في مجلد: $DOMAIN"

wget --mirror \
     --convert-links \
     --adjust-extension \
     --page-requisites \
     --no-parent \
     "$SITE_URL"

echo "✅ تم تحميل الموقع بالكامل!"
echo "⚡ افتح الملف:  $DOMAIN/index.html  واستمتع بالتصفح بدون إنترنت."

