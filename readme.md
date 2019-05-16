[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

# SecureCodeBox Ruby Scanner Scaffolding

A wrapper to easily integrate new scanner into the secureCodeBox.

This bundles a few basic concernes every worker service should fullfill:

*   Fetching and completing Tasks
*   Healthcheck endpoints
*   Error handeling

## Installation

In your Gemfile, include:  
 `gem "ruby-scanner-scaffolding", :git => "git://github.com/secureCodeBox/ruby-scanner-scaffolding.git"`

Ypu can require the gems through:
 
 `require 'bundler'`  
 `Bundler.setup(:default)`  
 `require 'ruby-scanner-scaffolding'`  
 `require 'ruby-scanner-scaffolding/healthcheck'`

## Handeling Errors

In case of a scan failure you can throw Errors from the Callback function. The Error message will be submitted back to the engine.
