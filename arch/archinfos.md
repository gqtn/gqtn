### 🦆 My Arch Guide
 All things I think are good.

---
### 🚀 Let's Go!

### About: Pacman
- For remove unused packages: `sudo pacman -Rns $(pacman -Qtdq)`\
> `pacman -Qtdq`: list orphaned (unused) packages

### About: General
- Config editor for git: `git config --global core.editor vim`


### About Browsers:
- Chromium browsers (like Brave Browser or Vivaldi) you can enable the touchpad scroll, adding `--enable-features=TouchpadOverscrollHistoryNavigation` in `.desktop` file.

- In Brave Browser, you can debloat it using *policies*, adding this code in `/etc/brave/policies/managed/policies.json`:
```bash
{
  "BraveAIChatEnabled": false,
  "BraveRewardsDisabled": true,
  "BraveWalletDisabled": true,
  "BraveVPNDisabled": true,
  "TorDisabled": true,
  "BraveP3AEnabled": false,
  "BraveStatsPingEnabled": false,
  "BraveWebDiscoveryEnabled": false,
  "BraveNewsDisabled": true,
  "BraveTalkDisabled": true,
  "BraveSpeedreaderEnabled": true,
  "BraveWaybackMachineEnabled": false,
  "BravePlaylistEnabled": false,
  "SyncDisabled": false,
  "PasswordManagerEnabled": false,
  "AutofillAddressEnabled": false,
  "AutofillCreditCardEnabled": false,
  "TranslateEnabled": false,
  "DnsOverHttpsMode": "secure",
  "DnsOverHttpsTemplates": "https://dns.adguard-dns.com/dns-query"
}

```
