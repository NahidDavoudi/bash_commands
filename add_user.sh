#!/usr/bin/env bash
# setup-nahid-user.sh
# اجرا با: sudo bash setup-nahid-user.sh
# هدف: آماده‌سازی کامل کاربر nahid برای جایگزینی root

set -euo pipefail

USERNAME="nahid"

if [[ $EUID -ne 0 ]]; then
  echo "این اسکریپت باید با root اجرا بشه (sudo bash setup-nahid-user.sh)"
  exit 1
fi

if ! id "$USERNAME" &>/dev/null; then
  echo "کاربر $USERNAME وجود نداره. اول با: adduser $USERNAME بسازش."
  exit 1
fi

echo "==> اضافه کردن $USERNAME به گروه sudo"
usermod -aG sudo "$USERNAME"

# اگر docker نصبه، به گروه docker هم اضافه کن تا بدون sudo بتونه docker/docker compose بزنه
if getent group docker &>/dev/null; then
  echo "==> اضافه کردن $USERNAME به گروه docker"
  usermod -aG docker "$USERNAME"
else
  echo "==> گروه docker پیدا نشد (احتمالاً هنوز نصب نشده) - رد شد"
fi

echo "==> ساخت پوشه ssh برای $USERNAME"
USER_HOME=$(eval echo "~$USERNAME")
mkdir -p "$USER_HOME/.ssh"
chmod 700 "$USER_HOME/.ssh"
touch "$USER_HOME/.ssh/authorized_keys"
chmod 600 "$USER_HOME/.ssh/authorized_keys"

# اگر root کلید authorized_keys داره، بپرس که کپی بشه یا نه
ROOT_AUTH_KEYS="/root/.ssh/authorized_keys"
if [[ -f "$ROOT_AUTH_KEYS" ]]; then
  read -rp "کلید SSH فعلی root رو برای $USERNAME هم کپی کنم؟ (y/n) " COPY_KEY
  if [[ "$COPY_KEY" == "y" ]]; then
    cat "$ROOT_AUTH_KEYS" >> "$USER_HOME/.ssh/authorized_keys"
    echo "کلید کپی شد."
  fi
fi

# اگر می‌خوای مستقیم یه پابلیک‌کی جدید بدی، این خط رو دستی پر کن و از حالت کامنت درش بیار:
# echo "ssh-ed25519 AAAA... your_key_comment" >> "$USER_HOME/.ssh/authorized_keys"

chown -R "$USERNAME:$USERNAME" "$USER_HOME/.ssh"

echo "==> بررسی sudo بدون رمز (اختیاری)"
read -rp "می‌خوای $USERNAME بدون وارد کردن پسورد sudo کنه؟ (y/n) " NOPASSWD
if [[ "$NOPASSWD" == "y" ]]; then
  echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" > "/etc/sudoers.d/90-$USERNAME"
  chmod 440 "/etc/sudoers.d/90-$USERNAME"
  echo "sudo بدون پسورد فعال شد."
fi

echo ""
echo "=================================================="
echo "مرحله بعدی (خیلی مهم): قبل از قطع دسترسی root،"
echo "از یه ترمینال جدید (بدون بستن سشن فعلی) تست کن:"
echo ""
echo "    ssh $USERNAME@<IP-سرور>"
echo "    sudo whoami   # باید root برگردونه"
echo ""
echo "اگه لاگین و sudo با موفقیت کار کرد، این دستور رو برای"
echo "غیرفعال کردن لاگین root اجرا کن:"
echo ""
echo "    sudo bash disable-root-login.sh"
echo "=================================================="
