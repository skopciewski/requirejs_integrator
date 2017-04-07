# frozen_string_literal: true
require "test_helper"
require "requirejs_integrator/command/compile"
require "requirejs_integrator/config"

class CompileTest < Minitest::Test
  def setup
    @config = RequirejsIntegrator::Config.new
    @output = StringIO.new
    @executor = FakeExecutor.new
    @command_args = { output: @output, executor: @executor, config: @config }
  end

  def test_run_comman_puts_output
    RequirejsIntegrator::Command::Compile.new(@command_args).run
    @output.rewind
    assert_equal 1, @output.each_line.count
  end

  def test_run_comman_call_system
    RequirejsIntegrator::Command::Compile.new(@command_args).run
    assert_match %r{^node .*/r\.js}, @executor.system_calls.first
  end
end
