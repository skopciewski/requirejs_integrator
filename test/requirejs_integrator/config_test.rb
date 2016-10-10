require "test_helper"
require "requirejs_integrator/config"

class ConfigTest < Minitest::Test
  def setup
    @config = RequirejsIntegrator::Config.new
  end

  def test_default_config_is_valid
    assert_equal true, @config.valid?
  end

  def test_configuration_has_default_project_javascript_dir_value
    assert_equal "javascripts", @config.fetch("project_javascripts_dir")
  end

  def test_configuration_has_default_project_js_compressed_dir_value
    assert_equal "js", @config.fetch("project_js_compressed_dir")
  end

  def test_configuration_has_default_project_ui_dir_value
    assert_equal ".", @config.fetch("project_ui_dir")
  end

  def test_configuration_has_default_project_public_dir_value
    assert_equal "public", @config.fetch("project_public_dir")
  end

  def test_configuration_has_default_project_config_dir_value
    assert_equal "config", @config.fetch("project_config_dir")
  end

  def test_configuration_has_default_project_requirejs_config_file_value
    assert_equal "build.js", @config.fetch("project_requirejs_config_file")
  end
end
