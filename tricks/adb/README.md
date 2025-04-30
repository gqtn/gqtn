# ADB Tools

### Basic
- Package in Debian: `adb`
- Port default: `5555`

### Remove application:
1. `adb shell`
2. `pm uninstall -k --user 0 {package.name}`


### My latest Xiaomi (POCO X7 Pro)
```
rodin:/ $ pm uninstall -k --user 0 com.xiaomi.mipicks
rodin:/ $ pm uninstall -k --user 0 com.miui.videoplayer
rodin:/ $ pm uninstall -k --user 0 com.miui.player
rodin:/ $ pm uninstall -k --user 0 com.mi.globalbrowser
rodin:/ $ pm uninstall -k --user 0 com.xiaomi.glgm
rodin:/ $ pm uninstall -k --user 0 com.google.android.apps.youtube.music
rodin:/ $ pm uninstall -k --user 0 com.google.android.apps.safetyhub
rodin:/ $ pm uninstall -k --user 0 com.google.android.videos
rodin:/ $ pm uninstall -k --user 0 com.google.android.googlequicksearchbox
rodin:/ $ pm uninstall -k --user 0 com.google.android.apps.bard
rodin:/ $ pm uninstall -k --user 0 com.android.chrome
rodin:/ $ pm uninstall -k --user 0 com.mi.globalminusscreen
```
