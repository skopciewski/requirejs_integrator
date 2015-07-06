require "spec_helper"

module RequirejsIntegrator
  describe "ri namespace rake tasks" do
    before :all do
      Rake.application.rake_require "requirejs_integrator/tasks/rjs"
      Rake::Task.define_task(:environment)
    end

    Given { allow(SystemExecutor::Executor).to receive(:new).and_return(executor) }
    Given(:executor) { double("executor", run: nil) }
    Given { allow(StdoutOutputter::Outputter).to receive(:new).and_return(outputter) }
    Given(:outputter) { double("outputter", write: nil) }

    describe "ri:compile" do
      Given(:rjs) { File.join(Gem.datadir("requirejs_integrator"), "r.js") }
      When { run_task("ri:compile") }
      Then { expect(executor).to have_received(:run).with(/^node #{rjs} /) }
      Then { expect(executor).to have_received(:run).with(%r{-o\s+config/build.js}) }
      Then { expect(executor).to have_received(:run).with(/ appDir=/) }
      Then { expect(executor).to have_received(:run).with(/ baseUrl=/) }
      Then { expect(executor).to have_received(:run).with(/ mainConfigFile=/) }
      Then { expect(executor).to have_received(:run).with(/ dir=/) }
    end
  end
end
