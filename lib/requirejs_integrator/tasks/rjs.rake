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

require 'exec_executor'
require 'system_executor'
require 'stdout_outputter'

namespace :ri do

  desc 'Compile js'
  task :compile do
    rjs_path = File.join(Gem.datadir('requirejs_integrator'), 'r.js')
    project_dir = ENV['project_dir'] || 'sinatra_ui'
    public_dir = ENV['public_dir'] || 'public'
    rjs_base_dir = ENV['rjs_base_dir'] || 'javascripts'
    rjs_opt_dir = ENV['rjs_opt_dir'] || 'js'
    appDir_path = File.join(
      Rake.application.original_dir,
      project_dir,
      public_dir,
      rjs_base_dir
    )
    dir_path = File.join(
      Rake.application.original_dir,
      project_dir,
      public_dir,
      rjs_opt_dir
    )
    mainConfigFile_path = File.join(
      Rake.application.original_dir,
      project_dir,
      public_dir,
      rjs_base_dir,
      'main.js'
    )
    StdoutOutputter::Outputter.new.write "*** Compile js files ***"
    SystemExecutor::Executor.new.run "node #{rjs_path} -o " \
      + "config/build.js " \
      + "appDir=#{appDir_path} " \
      + "baseUrl=./ " \
      + "mainConfigFile=#{mainConfigFile_path} " \
      + "dir=#{dir_path} "
  end

  task c: %w[compile]

end
