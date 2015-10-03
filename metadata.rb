name             'firefox-custom'
maintainer       'digitalRoots'
maintainer_email 'dev@droots.org'
license          'All rights reserved'
description      'Installs/Configures firefox-custom'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

supports 'windows'

suggest 'dmg'
suggest 'windows', '~> 1.38.2'
# depends 'windows'

depends 'firefox', '~> 2.0.5'

source_url 'https://github.com/digitalr00ts/firefox-custom' if respond_to?(:source_url)
issues_url 'https://github.com/digitalr00ts/firefox-custom/issues' if respond_to?(:issues_url)
