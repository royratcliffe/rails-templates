# Remove index.html and rails.png before firing up the Git repo
run '>README'
run 'rm public/index.html'
run 'rm public/images/rails.png'

if yes?('Do you want to use RSpec?')
  load_template 'http://github.com/royratcliffe/rails-templates/raw/master/base_template.rb'
end

git :init

file '.gitignore', <<-END
.DS_Store
log/*.log
tmp/**/*
config/database.yml
db/*.sqlite3
END
run 'touch tmp/.gitignore'
run 'touch log/.gitignore'
run 'touch vendor/.gitignore'
run 'cp config/database.yml config/example_database.yml'

git :add => '.'
# Strangely, this does not work unless you separate the initial add from the
# initial commit. Doing this step with a single invocation of git fails to
# commit.
git :commit => '-m "Initial commit"'

generate :controller, 'welcome index'
route "map.root :controller => 'welcome'"
git :add => '.', :commit => '-m "Welcome controller added"'
