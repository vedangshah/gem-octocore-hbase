require File.expand_path('../lib/octocore-hbase/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = 'octocore-hbase'
  s.version     = Octo::VERSION

  s.summary     = 'Octo Enterprise Core Modules for HBase'
  s.description = <<DESC
Octocore is the core framework of Octomatic Enterprise. It
contains all the core models, tasks, actions etc and uses HBase
DESC

  s.authors     = ['Pranav Prakash']
  s.email       = 'pp@octo.ai'
  s.files       = Dir['lib/**/*.rb', 'spec/**/*.rb', '[A-Z]*', 'lib/**/*.yml']

  s.executables << 'fakestream-hbase'
  s.executables << 'octocore-admin-hbase'

  s.homepage    =
    'https://github.com/octoai/gem-octocore-hbase'
  s.license       = 'Apache'

  s.has_rdoc    = true
  s.extra_rdoc_files = 'README.md'

  s.required_ruby_version = '>= 2.0'

  s.add_runtime_dependency 'thrift', '=0.6.0', '= 0.6.0'
  s.add_runtime_dependency 'massive_record',  '~> 0.2.2', '>= 0.2.2'
  s.add_runtime_dependency 'redis', '~> 3.2.2', '>= 3.2.0'
  s.add_runtime_dependency 'redis-queue', '~> 0.0.4', '>= 0.0.4'
  s.add_runtime_dependency 'hiredis', '~> 0.6.1', '>= 0.6.0'
  s.add_runtime_dependency 'rake', '~> 11.1.0', '>= 11.1.0'
  s.add_runtime_dependency 'resque', '~> 1.26.0', '>= 1.26.0'
  s.add_runtime_dependency 'resque-scheduler', '~> 4.1.0', '>= 4.1.0'
  s.add_runtime_dependency 'descriptive_statistics', '~> 2.5.1', '>= 2.5.0'
  s.add_runtime_dependency 'statsd-ruby', '~> 1.3.0', '>= 1.3.0'
  s.add_runtime_dependency 'hooks', '~> 0.4.1', '>= 0.4.1'
  s.add_runtime_dependency 'json', '~> 1.8.1', '>= 1.8.1'
  s.add_runtime_dependency 'ruby-kafka', '~> 0.3.2', '>= 0.3.2'
  s.add_runtime_dependency 'mandrill-api', '~> 1.0', '>= 1.0.53'
  s.add_runtime_dependency 'elasticsearch', '~> 1.0.17', '>= 1.0.17'
  s.add_runtime_dependency 'faraday', '~> 0.9.2', '>= 0.9.2'

  s.add_development_dependency 'rspec', '~> 3.4.0', '>= 3.4.0'
  s.add_development_dependency 'parallel_tests', '~> 2.5.0', '>= 2.5.0'
end

