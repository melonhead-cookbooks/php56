php56 Cookbook
==========================
Installs PHP v5.6

This cookbook is used to install PHP v5.6. It includes the basics required to allow for linting via Foodcritic, syntax checking via Rubocop, unit testing via Chefspec, and integration testing via Kitchen/Chef-zero.

Requirements
------------
#### Running
- `yum-remi` - Needed for installing PHP 5.6 packages

#### Testing
- `Test-kitchen` - Needed for assisting with integration testing
- `RSpec` - Needed for unit testing
- `ServerSpec` - Needed to run the integration tests
- `Foodcritic` - Needed for linting
- `Rubocop` - Needed for syntax checking
- `Berkshelf` - Needed to manage cookbook dependencies

Attributes
----------
#### php56::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td>['php56']['extensions']</td>
    <td>Hash</td>
    <td>Hash of boolean flags to specify the names of PHP and PECL extension packages to install alongside the core PHP packages</td>
    <td>[] (empty)</td>
  </tr>
</table>

Usage
-----
#### php56::default

Just include `php56` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[php56]"
  ]
}
```

To include extensions, include the `extensions` attribute:
```json
{
  "name":"my_node",
  "run_list": [
    "recipe[php56]"
  ],
  "php56": {
    "extensions": {
      "php-mbstring": true,
      "php-pecl-amqp": true
    }
  }
}
```

Testing
-----------
This cookbook supports the following tests:
- Foodcritic - linting and chef style standardization
- Rubocop - Ruby syntax checking
- Chefspec - Testing recipes via chef-zero (in memory chef run)
- Serverspec - Testing recipes through running VM and ensuring expected services are running

#### Test Preparation
In order to prepare system to run the following tests, the following packages must be installed on the workstation:

- Ruby

Once the above requirements are met, execute ```bundle install``` to download additional Ruby Gems needed.

Note: All bundle commands must be executed at the root level of the cookbook.

#### Foodcritic Tests
Foodcritic tests verify that it conforms to the Chef standards defined at ```http://acrmp.github.io/foodcritic/```.

Executing Foodcritic:
- ```bundle exec rake style:chef```

#### Rubocop Tests
Rubocop tests verify that it conforms to the Ruby coding standards defined at ```https://github.com/bbatsov/rubocop```.  Cops can be disabled by editing ```./rubocop.yml``` and turning off or tuning the appropriate tests.

Executing Rubocop:
- ```bundle exec rake style:ruby```.

Note: Both Foodcritic and Rubocop can be executed together by issuing ```bundle exec rake style```.

#### ChefSpec Tests
ChefSpec is a unit testing framework that runs chef-zero (or chef-solo) on your local machine for the purpose of simulating the convergence of resources on a node. ChefSpec is an extension of Rspec, which is a behavior-driven development (BDD) framework for Ruby.  The purpose of chefspec tests is to verify intention and not the actual execution/results of each resource.  More information can be found at ```https://github.com/sethvargo/chefspec``` and ```https://docs.getchef.com/chefspec.html```.

Executing ChefSpec:
- ```bundle exec rake spec```

#### ServerSpec Tests
ServerSpec is used for integration testing. The purpose of the tests is to verify services are up/down, ports are listening, and files exist in an expected location.  ServerSpec can be used to augment some shortcomings in Chef, such as stating a service should be up and listening on port 80, which chef will return true if the initial service start call returns true, even if the process died shortly after.  More information can be gathered at ```http://serverspec.org/resource_types.html```

Executing ServerSpec requires VirtualBox, Vagrant, Kitchen, and Berkshelf. It will instantiate a full VM and execute all dependency cookbooks similar to executing the cookbook in a production host.

Execute ServerSpec:
- ```bundle exec kitchen test``` - Performs setup, converge, verify, destroy steps

Available Suites:
- ```default``` - Default suit that runs basic test (is server up)

Additional Kitchen commands that are useful:
- ```bundle exec kitchen setup``` - Performs the initial setup of the VM but does not run recipes
- ```bundle exec kitchen converge``` - Converge cookbook on VM
- ```bundle exec kitchen verify``` - Runs ServerSpec tests on converged VM
- ```bundle exec kitchen login``` - SSH into VM for further troubleshooting
- ```bundle exec kitchen destroy``` - Destroy a VM no longer needed.

NOTE: Kitchen will not automatically destroy a VM that fails ServerSpec tests.  This is on purpose, to allow the user to perform a login to the VM and verify/fix the failure.  All future ```bundle exec kitchen test``` commands, will destroy the VM and recreate it before re-running the tests.

Contributing
------------
This is a private cookbook and should only be hosted within a private account in Github.

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: Salesforce.com
