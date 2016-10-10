# encoding: utf-8

# Copyright (C) 2015,2016 Szymon Kopciewski
#
# This file is part of RequirejsIntegrator.
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

require "requirejs_integrator/command_template"

module RequirejsIntegrator
  module Command
    class Compile < CommandTemplate
      def run
        @output.puts "*** Compile js files ***"
        @executor.system "node #{rjs_path} -o \
          #{config_file_path} \
          appDir=#{app_dir_path} \
          baseUrl=./ \
          mainConfigFile=#{main_config_file_path} \
          dir=#{destination_path}"
      end

      private

      def rjs_path
        File.join(Gem.datadir("requirejs_integrator"), "r.js")
      end

      def app_dir_path
        File.join(
          Rake.application.original_dir,
          @config.fetch("project_ui_dir"),
          @config.fetch("project_public_dir"),
          @config.fetch("project_javascripts_dir")
        )
      end

      def main_config_file_path
        File.join(
          app_dir_path,
          "main.js"
        )
      end

      def destination_path
        File.join(
          Rake.application.original_dir,
          @config.fetch("project_ui_dir"),
          @config.fetch("project_public_dir"),
          @config.fetch("project_js_compressed_dir")
        )
      end
    end
  end
end
