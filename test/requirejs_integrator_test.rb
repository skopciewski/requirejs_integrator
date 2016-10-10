require "test_helper"
require "requirejs_integrator"

class RequirejsIntegratorTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::RequirejsIntegrator::VERSION
  end
end
