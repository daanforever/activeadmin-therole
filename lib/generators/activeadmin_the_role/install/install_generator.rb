module ActiveadminTheRole
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include Rails::Generators::Migration
      source_root File.expand_path('../templates', __FILE__)

      def self.next_migration_number(dirname)
        orm = Rails.configuration.generators.options[:rails][:orm]
        require "rails/generators/#{orm}"
        "#{orm.to_s.camelize}::Generators::Base".constantize.next_migration_number(dirname)
      end

      def install
        generate "devise:install"
        generate "active_admin:install"
        generate "devise", "User"
        generate "the_role", "install"
        rake "the_role_engine:install:migrations"
        migration_template 'db/migrate/add_role_id_to_user.rb', 'db/migrate/add_role_id_to_user.rb'
        rake "db:migrate"
        copy_file "app/admin/roles.rb", "app/admin/roles.rb"
      end
    end
  end
end