name             'firefox-custom'
maintainer       'digitalRoots'
maintainer_email 'dev@droots.org'
license          'All rights reserved'
description      'Installs/Configures firefox-custom'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

supports 'windows'

suggests 'dmg'
suggests 'windows', '~> 1.38.1'
#depends 'windows'

depends 'firefox'

source_url 'https://github.com/digitalRoots/firefox-custom' if respond_to?(:source_url)
issues_url 'https://github.com/digitalRoots/firefox-custom/issues' if respond_to?(:issues_url)
