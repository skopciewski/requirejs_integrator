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
require "fileutils"

module RequirejsIntegrator
  module Command
    class GenerateConfiguration < CommandTemplate
      def run
        config_dir = File.dirname config_file_path
        return if File.exist?(config_file_path)
        @output.puts "*** Creating default RequireJS configuration ***"
        FileUtils.mkdir_p config_dir
        FileUtils.cp default_config_file_path, config_file_path
      end
    end
  end
end
