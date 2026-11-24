# Bài cá nhân 1 – Dựng tầng ảo hóa Hyper-V và VPS Ubuntu Server 24.04 LTS

- **Sinh viên:** Võ Đại Minh Trí — **MSSV:** `2324802010383`
- **Nền tảng ảo hóa:** Microsoft Hyper-V (Hypervisor loại 1 / Type 1)
- **Tên máy ảo & Hostname:** `vps-2324802010383`
- **Hệ điều hành:** Ubuntu Server 24.04.5 LTS (`noble`)

## 1. Cấu hình hạ tầng đã triển khai

| Thành phần | Thông số thực tế |
|---|---|
| Nền tảng ảo hóa | Microsoft Hyper-V trên Windows 11 (`DESKTOP-3IHMRK0`) |
| Virtual Switch | `CloudLab-NAT` (Internal Switch) + WinNAT `CloudLab-NAT-Network` |
| Dải mạng ảo | `192.168.100.0/24` (Gateway trên laptop: `192.168.100.1`) |
| VPS cấu hình | `vps-2324802010383` — Gen 2 UEFI, **2 vCPU**, **2 GB RAM**, **20 GB VHDX** |
| IP tĩnh VPS | `192.168.100.10/24`, Gateway `192.168.100.1`, DNS `8.8.8.8, 1.1.1.1` |
| Tài khoản quản trị | `tri2324802010383` (nhóm `sudo`) |
| Xác thực SSH | SSH Key `ED25519` (`PubkeyAuthentication yes`, `PasswordAuthentication no`, `PermitRootLogin no`) |
| Snapshot | `Bai1-HoanThanh-2324802010383` |

## 2. Cấu trúc kho lưu trữ

- `scripts/setup-hyperv-vps.ps1`: Script PowerShell khởi tạo Virtual Switch, NAT, máy ảo Hyper-V và Checkpoint.
- `configs/50-cloud-init.yaml`: Cấu hình Netplan đặt IP tĩnh `192.168.100.10/24` cho VPS.
- `configs/99-hardening.conf`: Cấu hình OpenSSH Server chỉ cho phép đăng nhập bằng khóa SSH, tắt đăng nhập mật khẩu và cấm đăng nhập `root`.

> **Lưu ý bảo mật:** Khóa SSH riêng (`id_ed25519_vps2324802010383`) và mật khẩu tài khoản không được đưa lên GitHub (đã loại trừ trong `.gitignore`).
