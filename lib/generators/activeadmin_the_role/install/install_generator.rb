class ActiveadminTheRole::InstallGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  def install
    generate "devise:install"
    generate "active_admin:install"
    generate "devise", "User"
    generate "the_role", "install"
    rake "the_role_engine:install:migrations"
    rake "db:migrate"
    copy_file "app/admin/roles.rb", "app/admin/#{file_name}.rb"
  end
end
