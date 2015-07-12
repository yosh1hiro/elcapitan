source 'https://rubygems.org'

ruby '2.2.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.1'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript asset
gem 'bootstrap-sass'
gem 'twitter-bootstrap-rails'
gem 'therubyracer', platforms: :ruby # javascript runtime。lessをコンパイルす>るために必要
gem 'haml-rails'
gem 'less-rails' # Railsでlessを使えるようにする。Bootstrapがlessで書かれてい>るため
gem 'kaminari'
gem 'kaminari-bootstrap'
gem 'mysql2'
gem 'ransack'
gem 'enum_help' #  Help ActiveRecord::Enum feature to work fine with I18n and simple_form.
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-turbolinks'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'bcrypt'
gem 'fog'
gem 'carrierwave'

gem 'seed-fu', github: 'mbleigh/seed-fu'
gem 'twitter-bootswatch-rails'
gem 'twitter-bootswatch-rails-helpers'
gem 'execjs'

gem 'flickraw'
gem 'instagram'


group :development, :test do

  gem 'rspec'                  # テストツール
  gem 'rspec-rails'            # RailsでRspecが使える
  gem 'spring'
  gem 'thin'                   # 開発用サーバ
  gem 'rails-erd'              # モデルのER図をPDFで出力してくれる
  gem 'rails_best_practices'   # Railsのベストプラクティスを教えてくれる
  gem 'capistrano'             # デプロイツール
  gem 'bullet'                 # 余計なSQLを検出できる

  gem 'guard-rspec'
  gem 'guard-livereload'       # ファイルが変更されたらページを自動リロード
  gem 'spring-commands-rspec'

  gem 'pry-rails'
  gem 'pry-doc'
  gem 'pry-stack_explorer'

  gem 'pry-byebug'
  gem 'better_errors'
  gem 'binding_of_caller'

  gem 'hirb'
  gem 'hirb-unicode'

  gem 'tapp'
  gem 'awesome_print'
  gem 'quiet_assets'
  gem 'annotate', git: 'git://github.com/ctran/annotate_models.git'
  gem 'timecop'
  gem 'database_rewinder'
end

group :test do
  gem 'launchy'
  gem 'selenium-webdriver'
  gem 'faker'
  gem 'factory_girl_rails'     # テストデータの生成
  gem 'database_cleaner'       # テスト実行後にDBをクリア
  gem 'capybara'               # ブラウザでの操作をシミュレートしてテストがで>きる
  gem 'shoulda-matchers', '2.5'
  gem 'vcr'
  gem 'webmock'
end

group :production do
  gem 'rails_12factor'
end
