# My Cloud Automation Setup

This repository contains the Terraform code I use to provision and manage cloud
infrastructure across multiple providers, including:

- **Oracle Cloud (OCI)**
- **Cloudflare**

## ✨ Highlights

- Secrets managed with
[`terraform-provider-sops`](https://github.com/carlpett/terraform-provider-sops)
- Secure credentials loading from an encrypted `secrets.yaml` file
- Multi-cloud setup using modular, provider-aware code
- Bucket creation, server provisioning, and networking handled declaratively
- Complementary to my [NixOS setup](https://github.com/lucianursu/servers)

## 🔐 Secrets Management

Secrets are defined in `secrets.yaml`, encrypted using
[SOPS](https://github.com/mozilla/sops) and Age.

Only the public keys are in the repo — the private decryption keys are **not**
included. All sensitive data is injected securely via the SOPS provider for
Terraform.

You can see how the secrets are used in [`provider.tf`](./provider.tf).

---

> ⚠️ This repository is shared for transparency and as a demonstration of my
> infrastructure-as-code workflow. It is **not** intended for general-purpose
> use.

