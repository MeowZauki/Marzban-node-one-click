# Marzban Node — Installation & Usage

**Bilingual documentation (English / فارسی)**

---

curl -fsSL https://raw.githubusercontent.com/MeowZauki/REPO/main/node.sh -o node.sh
chmod +x node.sh
./node.sh


## 📌 Overview — English

This repository provides a one-step installation script and configuration to run the **Marzban Node** service using Docker Compose. The package includes:

* A ready-to-run `setup-marzban-node.sh` installer script.
* `docker-compose.yml` content configured for `gozargah/marzban-node:latest`.
* Instructions for saving the SSL client certificate at `/var/lib/marzban-node/ssl_client_cert.pem`.

The script prints concise progress messages (colored) and prompts you to paste the certificate content interactively.

---

## 📌 مرور کلی — فارسی

این داکیومنت شامل راهنمای نصب و اجرای سرویس **Marzban Node** با استفاده از Docker Compose است. موارد زیر ارائه شده‌اند:

* اسکریپت نصب `setup-marzban-node.sh` که به‌صورت مرحله‌ای پیش می‌رود.
* محتوای `docker-compose.yml` آماده.
* راهنمای قرار دادن گواهی (certificate) در مسیر `/var/lib/marzban-node/ssl_client_cert.pem`.

اسکریپت پیام‌های مرحله‌ای رنگی نمایش می‌دهد و از شما می‌خواهد محتوای گواهی را پیست کنید.

---

## 🔧 Prerequisites — English

* A Debian/Ubuntu-like Linux server with sudo or root privileges.
* Working internet connection.
* `bash` shell (default on most distros).

---

## 🔧 پیش‌نیازها — فارسی

* سرور لینوکس (دبیان/اوبونتو یا مشابه) با دسترسی root یا sudo.
* اتصال اینترنتی برقرار.
* شِل `bash` (پیش‌فرض در اکثر توزیع‌ها).

---

## 📁 Files included

* `setup-marzban-node.sh` — Installation script (interactive for certificate).
* `README.md` — This bilingual documentation (you are reading it).

---

## ⚙️ What the installer does (high level) — English

1. Update system packages.
2. Install `curl`, `socat`, and `git`.
3. Install Docker using the official convenience script.
4. Clone `https://github.com/Gozargah/Marzban-node` into `~/Marzban-node`.
5. Create `/var/lib/marzban-node`.
6. Write a `docker-compose.yml` configured for Marzban Node.
7. Prompt you to paste the SSL client certificate.
8. Run `docker compose up -d`.

---

## ⚙️ کاری که اسکریپت انجام می‌دهد — فارسی

1. بروزرسانی پکیج‌ها.
2. نصب `curl`, `socat`, و `git`.
3. نصب Docker توسط اسکریپت رسمی.
4. کلون کردن مخزن `Gozargah/Marzban-node` در `~/Marzban-node`.
5. ایجاد دایرکتوری `/var/lib/marzban-node`.
6. نوشتن `docker-compose.yml` با تنظیمات لازم.
7. دریافت محتوای گواهی از کاربر.
8. اجرای `docker compose up -d`.

---

## ✅ Ports

* **SERVICE_PORT:** `8810`
* **XRAY_API_PORT:** `8811`

---

## 🛠 Installer script (setup-marzban-node.sh)

> The script included in this repo prints colored progress steps and shows a green check after each completed step. It hides verbose command output while still reporting the stage.

**Make sure to review the script before running it on production systems.**

---

## 🧾 Certificate format

You must paste the certificate including the `BEGIN` and `END` lines. Example:

```
-----BEGIN CERTIFICATE-----
MIIF... (base64 contents) ...
-----END CERTIFICATE-----
```

Paste the entire block when the script prompts you.

---

## 🔁 How to use — English

1. Upload `setup-marzban-node.sh` to your server.
2. Make it executable: `chmod +x setup-marzban-node.sh`.
3. Run the script as root or with sudo: `./setup-marzban-node.sh`.
4. When prompted, paste the certificate block (from `-----BEGIN CERTIFICATE-----` to `-----END CERTIFICATE-----`), then press ENTER and `Ctrl+D` to finish.

**After completion:** the compose file will be at `~/Marzban-node/docker-compose.yml` and the certificate at `/var/lib/marzban-node/ssl_client_cert.pem`.

---

## 🔁 نحوه‌ی استفاده — فارسی

1. فایل `setup-marzban-node.sh` را به سرور منتقل کنید.
2. اجازه اجرای آن را بدهید: `chmod +x setup-marzban-node.sh`.
3. با ریشه یا sudo اجرا کنید: `./setup-marzban-node.sh`.
4. وقتی از شما خواسته شد، بلوک گواهی (شامل خطوط `-----BEGIN CERTIFICATE-----` و `-----END CERTIFICATE-----`) را پیست کنید، سپس ENTER و بعد `Ctrl+D` را بزنید.

**بعد از اتمام:** فایل compose در `~/Marzban-node/docker-compose.yml` و گواهی در `/var/lib/marzban-node/ssl_client_cert.pem` ذخیره می‌شود.

---

## 🐞 Troubleshooting — English

* **Docker not installed or `docker` command not found**: Re-run the Docker install step manually or check `/var/log/installer` for errors.
* **`docker compose` not found**: Some systems need `docker-compose` plugin; run `docker compose version`. If missing, install the Compose plugin.
* **Ports in use**: Verify the ports `8810` and `8811` are free: `ss -tuln | grep -E "8810|8811"`.
* **Permission errors writing to `/var/lib/marzban-node`**: Run the script as root or `sudo`.

---

## 🐞 رفع اشکال — فارسی

* **پیغام: دستور docker نصب نشده**: مرحله نصب داکر را دستی اجرا کنید یا لاگ‌ها را بررسی کنید.
* **`docker compose` پیدا نمی‌شود**: بررسی کنید که پلاگین Compose نصب شده باشد (`docker compose version`).
* **پورت‌ها اشغال شده‌اند**: با `ss -tuln | grep -E "8810|8811"` بررسی کنید.
* **خطای دسترسی هنگام نوشتن در `/var/lib/marzban-node`**: اسکریپت را با دسترسی root یا sudo اجرا کنید.

---

