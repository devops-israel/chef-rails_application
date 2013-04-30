rails_application Cookbook
============================

This cookbooks installs the server-side Rails application.
Unlike the official OpsCode cookbooks, this cookbook has all of the possible
tweaks externalized in the form of attributes - it was intended that this
cookbook is used by a wrapper cookbook that provides the attributes which
configure the rails application per the requirements of the actual application.

This cookbook replaces the unicorn process supervisor to be upstart instead of
runit, it means that it will work on Ubuntu systems, later versions might allow
customizing the process supervisor as well.

Requirements
------------

Tested on Ubuntu 12.04 and depends on several OpsCode official cookbooks that
actually do the majority of the work.

#### packages

##### This cookbook depends on several OpsCode cookbooks, namely -

- git
- ruby
- nginx
- unicorn
- application
- application_ruby
- application_nginx

#####  for the rails_application::database_credentials cookbook, you also need -

- database

Several of the above required minor modifications, all of these have pull
requests and tickets with OpsCode, but until these get accepted, forks that
include the modifications are available here -

##### application_nginx cookbook

- Ticket: http://tickets.opscode.com/browse/COOK-2579
- Pull Request: https://github.com/opscode-cookbooks/application_nginx/pull/5
- Modified Cookbook: https://github.com/devops-israel/opscode-cookbooks-application_nginx.git


##### application_ruby cookbook (no pull requests at this time)

- Modified Cookbook: https://github.com/devops-israel/opscode-cookbooks-application_ruby.git


##### OpsCode cookbooks are available at -

- https://github.com/opscode-cookbooks/git.git
- https://github.com/opscode-cookbooks/ruby.git
- https://github.com/opscode-cookbooks/nginx.git
- https://github.com/opscode-cookbooks/unicorn.git
- https://github.com/opscode-cookbooks/application.git
- https://github.com/opscode-cookbooks/application_ruby.git
- https://github.com/opscode-cookbooks/application_nginx.git
- https://github.com/opscode-cookbooks/database.git


Attributes
----------

#### rails_application::default

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>rails/ruby/version</tt></td>
    <td>String</td>
    <td>which ruby version to use, see: ruby cookbook</td>
    <td><tt>1.9.1</tt></td>
  </tr>
  <tr>
    <td><tt>rails/app/name</tt></td>
    <td>String</td>
    <td>how to call the application</td>
    <td><tt>rails_app</tt></td>
  </tr>
  <tr>
    <td><tt>rails/app/path</tt></td>
    <td>String</td>
    <td>where the application is deployed to</td>
    <td><tt>/var/www/project/{{rails/app/name}}</tt></td>
  </tr>
  <tr>
    <td><tt>rails/app/environment</tt></td>
    <td>String</td>
    <td>rails/rack environment name</td>
    <td><tt>production</tt></td>
  </tr>
  <tr>
    <td><tt>rails/owner</tt></td>
    <td>String</td>
    <td>user name to own files and processes</td>
    <td><tt>deploy</tt></td>
  </tr>
  <tr>
    <td><tt>rails/group</tt></td>
    <td>String</td>
    <td>group name to own files and processes</td>
    <td><tt>deploy</tt></td>
  </tr>
  </tr>
  <tr>
    <td><tt>rails/packages</tt></td>
    <td>Array</td>
    <td>additional packages that need to be installed for the application to work</td>
    <td><tt>[ ]</tt></td>
  </tr>
  <tr>
    <td><tt>rails/gems</tt></td>
    <td>Array</td>
    <td>additional system-wide gems that need to be installed for the application to work</td>
    <td><tt>[ ]</tt></td>
  </tr>
</table>


Usage
-----

#### rails_application::default

Just include `rails_application` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[rails_application]"
  ]
}
```

Contributing
------------

This cookbook is still a work in progress, you are welcome to help by
contributing fixes, documentation and tests.

e.g.

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
### License

See [LICENSE](LICENSE) for full details.

##### Authors:

 - Evgeny Zislis <evgeny@devops.co.il>
 - Elad Dolev <elad@devops.co.il>
