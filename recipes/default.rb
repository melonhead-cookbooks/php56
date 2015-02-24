# Encoding: utf-8
#
# Cookbook Name:: php56
# Recipe:: default
#
# Copyright 2014, Pardot, a Salesforce.com company
#

# This recipe should only call other recipes and shoud not perform any
# modification of the system. This is to allow granular control over
# which recipes a user wants to run.

include_recipe 'php56::install'
include_recipe 'php56::configure'
