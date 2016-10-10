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

module RequirejsIntegrator
  class CommandTemplate
    def initialize(config:, output: $stdout, executor: ::Kernel)
      @config = config
      @output = output
      @executor = executor
    end

    def run
      raise NotImplementedError
    end

    private

    def config_file_path
      File.join(
        Rake.application.original_dir,
        @config.fetch("project_ui_dir"),
        @config.fetch("project_config_dir"),
        @config.fetch("project_requirejs_config_file")
      )
    end

    def default_config_file_path
      File.join(
        Gem.datadir("requirejs_integrator"),
        "build.js.default"
      )
    end
  end
end
