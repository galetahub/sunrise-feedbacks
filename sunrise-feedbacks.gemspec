# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "sunrise/feedbacks/version"

Gem::Specification.new do |s|
  s.name = "sunrise-feedbacks"
  s.version = Sunrise::Feedbacks::VERSION.dup
  s.platform = Gem::Platform::RUBY 
  s.summary = "Rails CMS votes"
  s.description = "Sunrise is a Aimbulance CMS: feedbacks module"
  s.authors = ["Igor Galeta", "Pavlo Galeta"]
  s.email = "galeta.igor@gmail.com"
  s.rubyforge_project = "sunrise-feedbacks"
  s.homepage = "https://github.com/galetahub/sunrise-feedbacks"
  
  s.files = Dir["{app,config,lib}/**/*"] + ["Rakefile", "README.rdoc"]
  s.test_files = Dir["{test}/**/*"]
  s.extra_rdoc_files = ["README.rdoc"]
  s.require_paths = ["lib"]
  
  s.add_dependency("sunrise-cms")
end
