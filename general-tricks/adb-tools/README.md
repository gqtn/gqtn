# ADB Tools

### Connection
- Package in Debian: `adb`
- Package in Arch Linux: `android-tools`
- Port default: `5555`

### To remove application:
1. `adb shell`
2. `pm uninstall -k --user 0 {package.name}`


### Example
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
