# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{radius19}
  s.version = "0.5.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Adrian Madrid", "John W. Long"]
  s.date = %q{2009-10-01}
  s.email = %q{aemadrid@gmail.com}
  s.extra_rdoc_files = [
    "README"
  ]
  s.files = [
    ".document",
     ".gitignore",
     ".idea/inspectionProfiles/Project_Default.xml",
     ".idea/inspectionProfiles/profiles_settings.xml",
     "CHANGELOG",
     "QUICKSTART",
     "README",
     "ROADMAP",
     "Rakefile",
     "VERSION",
     "lib/radius/context.rb",
     "lib/radius/dostruct.rb",
     "lib/radius/errors.rb",
     "lib/radius/parser.rb",
     "lib/radius/parsetag.rb",
     "lib/radius/tagbinding.rb",
     "lib/radius/tagdefs.rb",
     "lib/radius/util.rb",
     "lib/radius19.rb",
     "test/context_test.rb",
     "test/dostruct_test.rb",
     "test/parser_test.rb",
     "test/tagbinding_test.rb",
     "test/tagdefs_test.rb",
     "test/test_helper.rb",
     "test/util_test.rb"
  ]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/aemadrid/radius19}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{A small, but powerful tag-based template language for Ruby modeled after the ones used in MovableType and TextPattern. It has tags similar to XML, but can be used to generate any form of plain text (HTML, e-mail, etc...) adapted to work on Ruby 1.9.}
  s.test_files = [
    "test/dostruct_test.rb",
     "test/tagdefs_test.rb",
     "test/test_helper.rb",
     "test/tagbinding_test.rb",
     "test/parser_test.rb",
     "test/util_test.rb",
     "test/context_test.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
