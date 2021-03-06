require_relative "../config/application"
ActiveRecord::Base.logger = nil

def migrate(version = nil)
  ActiveRecord::Migration.verbose = false
  ActiveRecord::Migrator.migrations_paths << File.expand_path(File.dirname(__FILE__), '../db/migrate')
  if defined?(ActiveRecord::MigrationContext)
    ActiveRecord::MigrationContext
      .new(ActiveRecord::Migrator.migrations_paths)
      .migrate(version)
  else
    ActiveRecord::Migrator.migrate(ActiveRecord::Migrator.migrations_paths, version)
  end
end

def create_db
  `rm -rf #{ActiveRecord::Base.configurations["test"]["database"]}`
  ActiveRecord::Base.establish_connection(:test)
end

def drop_db
  `rm -rf #{ActiveRecord::Base.configurations["test"]["database"]}`
end

Dir["#{__dir__}/../app/models/*.rb"].each {|file| require file }
I18n.enforce_available_locales = false
