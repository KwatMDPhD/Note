## Erase macOS.

Restart > Load Recovery Mode > Disk Utility > Volume > Erase > APFS

## Reinstall macOS.

Analytics > All > 👎

Siri > All > 👎

## System Settings

### Update.

General > Software Update > Update.

### Apple ID

Picture > Set.

iCloud > Optimize Mac Storage > 👎

iCloud > All except: Photos, iCloud Drive, iCloud Mail, Password & Keychain, Notes, Find My Mac, Contacts, Calendars, Reminders, Safari, and Stocks > 👎

iCloud > Manage... > All except: Family, iCloud Drive, Messages, Photos, Mail, Backups, Voice Memos, and Safari > 👎

iCloud > iCloud Drive > Apps syncing to iCloud Drive > All except: Messages, Mail, Photos, Keynote, and Books > 👎

iCloud > iCloud Drive > Apps syncing to iCloud Drive > Options... > Look Me Up By Email > Empty.

iCloud > Private Relay > Turn On...

iCloud > Private Relay > IP Address Location > Use country and time zone

iCloud > Advanced Data Protection > Turn On... (may have to wait)

### Family

Name (Me) > Purchases > Share My Purchases > 👍

Name (Me) > Location Sharing > Everyone and Automatically Share Location > 👍

### Wi-Fi

Advanced... > Known Networks > Unknown ones > ... > Remove From List

### Bluetooth

My Devices > Unneeded ones > i > Forget This Device...

### Focus

All except: Do Not Disturb > 👎

Focus status > Share Focus status > 👎

### General

About > Name > Rename

Storage > Store in iCloud... > Cancel

Storage > Messages > i > All > Delete

Language & Region > Temperature > Celsius (C)

Language & Region > Measurement system > Metric

Language & Region > First day of week > Monday

Language & Region > Date format > 2023.08.19

Date & Time > 24-hour time > 👍

### Control Center

Control Center Modules > All > Show When Active or (if not available) Don’t Show in Menu Bar

Battery > Show Percentage > 👍

Menu Bar Only > All > Don’t Show in Menu Bar

### Privacy & Security

Location Services > System Services > Details... > Significant locations > 👎

Location Services > System Services > Details... > Significant locations > Details... > ... > Clear History

Location Services > System Services > Details... > All except: Location-based alerts, Setting time zone, System customization, Find My Mac, Networking and wireless, and Wi-Fi calling > 👎

Location Services > System Services > Details... > Significant locations > Show location icon in menu bar when System Services request your location > 👍

Analytics & Improvements > All > 👎

Apple Advertising > Personalized Ads > 👎

Extensions > Sharing > All except: Copy Link > 👎

### Desktop & Dock

Position on screen > Left

Automatically hide and show the Dock > 👍

Show recent applications in Dock > 👎

Automatically rearrange Spaces based on most recent use > 👎

Hot Corners... > (top left and clock wise) Mission Control, Notification Center, Desktop, and Application Windows

### Displays

Arrange... > Vertically.

Built-in Display > Use as > Main display

Built-in Display > Text size > Default

Built-in Display > Refresh rate > ProMotion

Built-in Display > Night Shift... > Schedule > Sunset to Sunrise

Built-in Display > Night Shift... > Color temperature > Warmest.

Monitor > Use as > Extended display

Monitor > Text size > Match Built-in Display.

Monitor > Refresh rate > Maximize.

### Touch ID & Password

Touch ID > Set two fingers.

### Internet Accounts

All except: Mail > 👎

### Game Center

Game Center > Sign Out > Sign Out

### Keyboard

Key repeat rate > Fastest.

Delay until repeat > Shortest.

Turn keyboard backlight off after inactivity > After 1 Minute

Press 🌐 key to > Change Input Source

Touch Bar Settings... > Touch Bar shows > Expanded Control Strip

Touch Bar Settings... > Customize Control Strip > Space joining: Keyboard Brightness, Brightness, Volume, Media, Night Shift, and Sleep)

### Mouse

Point & Click > Tracking speed > Fourth fastest.

Point & Click > Secondary click > Click Right Side

Point & Click > Smart zoom > 👍

More Gestures > Swipe between pages > Scroll Left or Right with One Finger

### Trackpad

Tracking speed > Fourth fastest.

Tap to click > 👍

## Finder

### Settings...

General > Show these items on the desktop: > External disks, CDs, DVDs, and iPods, and Connected servers > 👍

General > New Finder windows show: > User

Tags > All > Delete Tags

Sidebar > Favorites > (Select in order) Recents, Applications, User, and Downloads

Advanced > Show all filename extensions > 👍

Advanced > Show warning before removing from iCloud Drive > 👎

### Show View Options

Icon size > Large

Show columns: > All except: Data Modified and Size > 👎

Calculate all sizes > 👍

Use as Defaults

### Desktop

Sort By > Date Modified

## Dock

All except: Finder, Downloads, and Trash > 👎

## Safari > Settings...

General > Safari opens with: > A new private window

General > Open "safe" files after downloading > 👎

Websites > Page Zoom > All > Remove

Websites > Camera > When visiting other websites > Deny

Websites > Microphone > When visiting other websites > Deny

Websites > Screen Sharing > When visiting other websites > Deny

Websites > Location > When visiting other websites > Deny

Websites > Notifications > Allow websites to ask for permission to send notification > 👎

Extensions > Vimari, Ad block, and Grammarly > Install and 👍

Advanced > Show Develop menu in menu bar > 👍

## Messages > Settings...

General > Share Name and Photo > 👍

General > Share Automatically > Contacts Only

iMessage > Send read receipts > 👎

Shared with You > Automatic Sharing > 👎

Shared with You > All > 👎

## Terminal

Settings... > Profiles > Import `terminal/*`

```bash
cp setting/zshrc ~/.zshrc &&

cp setting/vimrc ~/.vimrc &&

cp setting/screenrc ~/.screenrc
```

```vim
:PlugInstall
```

## Install `brew` and other command-line tools.

https://brew.sh

```bash
brew install screen tree rename watch macvim fzf ripgrep node yarn shfmt xclip xsel exiftool imagemagick
```

## MacVim > Settings...

After last window closes: > Quit MacVim

Resizing window: > Smoothly resizes window > 👍

## Set `git`

```bash
git config --global user.name "KwatMDPhD" &&

git config --global user.email "kwat.me@icloud.com" &&

git config --global credential.helper osxkeychain &&

git config --global fetch.prune true &&

git config --global pull.rebase true &&

git config --global status.submoduleSummary true &&

git config --global diff.submodule log &&

git config --global diff.colorMoved zebra &&

git config --global --list
```

## Install and set `julia`

https://julialang.org/downloads

```julia
using Pkg: add

for pa in ("BenchmarkTools", "Revise", "TestEnv")

    add(pa)

end
```

```bash
mkdir -p ~/.julia/config &&

cp setting/startup.jl ~/.julia/config
```

```bash
cp setting/JuliaFormatter.toml ~/.JuliaFormatter.toml
```

## Set `node`

```bash
npm install --global prettier prettier-plugin-svelte
```
