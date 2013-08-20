# CHANGELOG for rails_application

This file is used to list changes made in each version of rails_application.

## 0.2.3:

* Set explicit requirement for nginx cookbook version. Old-er nginx had no $msec.

## 0.2.2:

* Add the X-Request-Start parameter for NewRelic frontend request queue time.

## 0.2.1:

* Enable `rollback_on_error` attribute modification

## 0.2.0:

* Fix nginx load balancer configuration to handle static assets correctly.

## 0.1.10:

* Use `application_socket` from application_nginx cookbook

## 0.1.9:

* Restart unicorn instead of starting a started upstart job, which fails.

## 0.1.8:

* Fix for cookbook_name not being a string in chef-solo by emirikol@github


## 0.1.7:

* Unicorn socket to be owned by unicorn process user


## 0.1.6:

* Use rails owner and group to own the unicorn process


## 0.1.5:

* Allow to change content of unicorn init and configuration files.


## 0.1.4:

* Allow override for unicorn command and configuration


## 0.1.3:

* Update dependency on `application` cookbook version to 2.0.2


## 0.1.2:

* Upstart supports status+restart for service[unicorn]
* Start rails projects with unicorn_rails where config.ru is not there


## 0.1.1:

* Fix markdown in README file to display properly


## 0.1.0:

* Initial release of rails_application

- - -
Check the [Markdown Syntax Guide](http://daringfireball.net/projects/markdown/syntax) for help with Markdown.

The [Github Flavored Markdown page](http://github.github.com/github-flavored-markdown/) describes the differences between markdown on github and standard markdown.
