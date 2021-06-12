# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules', 'app', 'assets')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
Rails.application.config.assets.precompile += %w( */assets/dropzone*.js */assets/dropzone*.css */assets/bootstrap*.js */assets/bootstrap*.css */assets/gmaps*.js */assets/gmaps*.css */assets/jquery-ui*.js */assets/jquery-ui*.css */assets/pickadate*.js */assets/pickadate*.css */assets/tether*.js */assets/tether*.css )