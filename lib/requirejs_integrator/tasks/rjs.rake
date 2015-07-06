# encoding: utf-8

# Copyright (C) 2015 Szymon Kopciewski
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

require "exec_executor"
require "system_executor"
require "stdout_outputter"

namespace :ri do
  desc "Compile js"
  task :compile do
    rjs_path = File.join(Gem.datadir("requirejs_integrator"), "r.js")
    project_ui_dir = ENV["PROJECT_UI_DIR"] || "."
    project_public_dir = ENV["PROJECT_PUBLIC_DIR"] || "public"
    project_js_dir = ENV["PROJECT_JS_DIR"] || "javascripts"
    project_rjs_dir = ENV["PROJECT_RJS_DIR"] || "js"
    app_dir_path = File.join(
      Rake.application.original_dir,
      project_ui_dir,
      project_public_dir,
      project_js_dir
    )
    dir_path = File.join(
      Rake.application.original_dir,
      project_ui_dir,
      project_public_dir,
      project_rjs_dir
    )
    main_config_file_path = File.join(
      Rake.application.original_dir,
      project_ui_dir,
      project_public_dir,
      project_js_dir,
      "main.js"
    )
    StdoutOutputter::Outputter.new.write "*** Compile js files ***"
    SystemExecutor::Executor.new.run "node #{rjs_path} -o \
      config/build.js \
      appDir=#{app_dir_path} \
      baseUrl=./ \
      mainConfigFile=#{main_config_file_path} \
      dir=#{dir_path}"
  end

  task c: %w(compile)
end
