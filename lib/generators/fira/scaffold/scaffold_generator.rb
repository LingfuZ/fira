require 'rails/generators/erb/scaffold/scaffold_generator'

module Fira
  module Generators

    class ScaffoldGenerator < Erb::Generators::ScaffoldGenerator
      source_root File.expand_path("../templates", __FILE__)

      def copy_view_files
        available_views.each do |view|
          filename = filename_with_extensions(view)
          template "#{view}.html.fira", File.join("app/views", controller_file_path, filename)
        end
      end

      hook_for :form_builder, :as => :scaffold

      def copy_form_file
        if options[:form_builder].nil?
          filename = filename_with_extensions("_form")
          template "_form.html.fira", File.join("app/views", controller_file_path, filename)
        end
      end

    protected

      def available_views
        %w(index edit show new _form)
      end

      def handler
        :fira
      end

    end
  end
end