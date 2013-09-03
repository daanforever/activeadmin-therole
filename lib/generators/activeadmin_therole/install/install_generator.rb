module ActiveadminTherole
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include Rails::Generators::Migration
      source_root File.expand_path('../templates', __FILE__)

      def self.next_migration_number(dirname)
        orm = Rails.configuration.generators.options[:rails][:orm]
        require "rails/generators/#{orm}"
        "#{orm.to_s.camelize}::Generators::Base".constantize.next_migration_number(dirname)
      end

      # Action: generate active_admin:install
      def activeadmin_install
        if File.exists?(File.join(destination_root, "config", "initializers", "active_admin.rb"))
          log :generate, "No need to install ActiveAdmin, already done."
        else
          generate "active_admin:install"
        end
      end

      # Action: generate devise User
      def user_model_create
        if File.exists?(File.join(destination_root, "app", "models", "user.rb"))
          log :generate, "No need to create User model, already done."
        else
          generate "devise", "User"
        end
      end

      # Action: generate the_role install
      def therole_install
        if File.exists?(File.join(destination_root, "config", "initializers", "the_role.rb"))
          log :generate, "No need to install TheRole, already done."
        else
          generate "the_role", "install"
          rake "the_role_engine:install:migrations"
          migration_template 'db/migrate/add_role_id_to_user.rb', 'db/migrate/add_role_id_to_user.rb'
          rake "db:migrate"
          generate "the_role", "admin"
        end
      end

      def invoke_db_migrate
        rake "db:migrate"
      end

      # Execute all steps for Devise, ActiveAdmin and TheRole
      def install
        if File.exists?(File.join(destination_root, "app", "admin", "roles.rb"))
          log :generate, "No need to copy admin/roles.rb, already done."
        else
          # copy our section
          copy_file "app/admin/roles.rb", "app/admin/roles.rb"
        end
      end

    end
  end
end
