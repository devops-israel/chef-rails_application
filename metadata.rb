name             'rails_application'
maintainer       'Devops Israel'
maintainer_email 'evgeny@devops.co.il'
license          'All rights reserved'
description      'Installs/Configures rails_application'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.8'

depends "git"
depends "ruby"
depends "nginx"
depends "unicorn"
depends "application", ">= 2.0.2"
depends "application_ruby"
depends "application_nginx"

# to use the rails_application::database_credentials recipe
recommends "database"
