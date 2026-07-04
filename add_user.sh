#!/usr/bin/env bash
# setup-nahid-user.sh
# Run with: sudo bash setup-nahid-user.sh
# Purpose: Fully prepare the "nahid" user to replace root usage

set -euo pipefail

USERNAME="nahid"

if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root (sudo bash setup-nahid-user.sh)"
  exit 1
fi

if ! id "$USERNAME" &>/dev/null; then
  echo "User $USERNAME does not exist. Create it first with: adduser $USERNAME"
  exit 1
fi

echo "==> Adding $USERNAME to the sudo group"
usermod -aG sudo "$USERNAME"

# If docker is installed, add the user to the docker group too (no sudo needed for docker commands)
if getent group docker &>/dev/null; then
  echo "==> Adding $USERNAME to the docker group"
  usermod -aG docker "$USERNAME"
else
  echo "==> docker group not found (probably not installed yet) - skipping"
fi

echo "==> Creating .ssh directory for $USERNAME"
USER_HOME=$(eval echo "~$USERNAME")
mkdir -p "$USER_HOME/.ssh"
chmod 700 "$USER_HOME/.ssh"
touch "$USER_HOME/.ssh/authorized_keys"
chmod 600 "$USER_HOME/.ssh/authorized_keys"

# If root has an authorized_keys file, ask whether to copy it over
ROOT_AUTH_KEYS="/root/.ssh/authorized_keys"
if [[ -f "$ROOT_AUTH_KEYS" ]]; then
  read -rp "Copy root's current SSH key to $USERNAME as well? (y/n) " COPY_KEY
  if [[ "$COPY_KEY" == "y" ]]; then
    cat "$ROOT_AUTH_KEYS" >> "$USER_HOME/.ssh/authorized_keys"
    echo "Key copied."
  fi
fi

# To add a new public key directly, uncomment and fill in this line:
# echo "ssh-ed25519 AAAA... your_key_comment" >> "$USER_HOME/.ssh/authorized_keys"

chown -R "$USERNAME:$USERNAME" "$USER_HOME/.ssh"

echo "==> Checking passwordless sudo (optional)"
read -rp "Allow $USERNAME to run sudo without a password? (y/n) " NOPASSWD
if [[ "$NOPASSWD" == "y" ]]; then
  echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" > "/etc/sudoers.d/90-$USERNAME"
  chmod 440 "/etc/sudoers.d/90-$USERNAME"
  echo "Passwordless sudo enabled."
fi

echo ""
echo "=================================================="
echo "Next step (very important): before revoking root access,"
echo "test from a NEW terminal (without closing your current session):"
echo ""
echo "    ssh $USERNAME@<server-ip>"
echo "    sudo whoami   # should return 'root'"
echo ""
echo "If login and sudo work correctly, run this command to"
echo "disable root SSH login:"
echo ""
echo "    sudo bash disable-root-login.sh"
echo "=================================================="
