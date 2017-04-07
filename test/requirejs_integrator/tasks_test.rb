# frozen_string_literal: true
require "test_helper"
require "requirejs_integrator/tasks"

class TasksTest < Minitest::Test
  def test_set_configuration
    RequirejsIntegrator::Tasks.load("conf")
    assert_equal "conf", RequirejsIntegrator::Tasks.config
  end
end
