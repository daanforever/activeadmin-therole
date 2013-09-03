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

      # Execute all steps for Devise, ActiveAdmin and TheRole
      def install
        # install devise
        generate "devise:install"
        # install activeadmin
        generate "active_admin:install"
        # create User model
        generate "devise", "User"
        # install TheRole
        generate "the_role", "install"
        # create migration for TheRole
        rake "the_role_engine:install:migrations"
        # copy our migration
        migration_template 'db/migrate/add_role_id_to_user.rb', 'db/migrate/add_role_id_to_user.rb'
        # prepare database
        rake "db:migrate"
        # copy our section
        copy_file "app/admin/roles.rb", "app/admin/roles.rb"
        # create Admin role for TheRole
        generate "the_role", "admin"
      end
    end
  end
end