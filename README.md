# firefox-custom-cookbook
[![Build Status](https://secure.travis-ci.org/digitalRoots/firefox-custom.png)](http://travis-ci.org/digitalRoots/firefox-custom)

Chef cookbook to enabled customization of Firefox installation.

## Supported Platforms
 * Windows XP
 * Windows Vista
 * Windows 7
 * Windows 2003
 * Windows 2008
 * Windows 2012
 * Linux
 * Mac OS X (unverified)

Will support what ever the Supermarket cookbook [firefox](https://supermarket.chef.io/cookbooks/firefox) supports

HELP: Need contributor for Mac OS X

## Attributes

  * ['firefox-custom']['cfg-src'] - custom url/path to config file

## Usage

### firefox-custom::default

Include `firefox-custom` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[firefox-custom::default]"
  ]
}
```
## TO DOs
* Change mozilla.cfg from remote_file to template
* Add override.ini
* Add userChrome.css/userContent.css
* Add 
  * greprefs.js - preferences shared by all applications using the Mozilla platform
  * services/common/services-common.js - preferences for some shared services code, this should arguably be included in some other file
  * defaults/pref/services-sync.js - default preferences for Firefox sync, also oddly misplaced
  * browser/app/profile/channel-prefs.js - a file indicating the user's update channel. This is kept separate from other preferences because it can affect how updates are applied.
  * browser/app/profile/firefox.js - defaults specific to Firefox
  * browser/app/profile/firefox-branding.js - defaults specific to the specific kind of Firefox being installed (Nightly, Aurora, Beta, Release)
  * browser/defaults/preferences/firefox-l10n.js - defaults specific to the installed language of Firefox. None of the other preference files contain locale-specific preferences.

## Links 
- http://kb.mozillazine.org/User.js_file
- http://kb.mozillazine.org/Prefs.js_file
- http://kb.mozillazine.org/About:config_entries
- http://kb.mozillazine.org/Locking_preferences
- http://kb.mozillazine.org/Security_Policies

## License and Authors

Author:: digitalR00ts(<developement@digitalr00ts.com>)
