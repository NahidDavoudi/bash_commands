rm -rf .git              # پاک کردن تاریخچه و اتصال به template
git init                 # شروع یه تاریخچه گیت تازه و مستقل
git add .
git commit -m "init: setup for client1"

git remote add origin git@github.com:ehsan2400/shop-client1.git
git push -u origin main