# How to port this to Legacy GT iOS Website

1. Move all of the contents in `assets/calculator/` to `app/assets/images/calculator/` in the rails-site
2. Move all of the tutorials .md files (part*.md) to `app/assets/tutorials/calculator/`
3. `rm -rf public` when in the root directory of the rails-site
4. `rake assets:precompile` to compile the assets
5. `rails s` to run the server on `localhost:3000`
6. To push to heroku, git add, git commit, and then `git push heroku master` if you have permission.
