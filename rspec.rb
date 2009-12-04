plugin 'rspec', :git => 'git://github.com/dchelimsky/rspec.git'
plugin 'rspec-rails', :git => 'git://github.com/dchelimsky/rspec-rails.git'
generate :rspec

git :add => '.'
git :commit => '-m "Added RSpec plug-in"'
