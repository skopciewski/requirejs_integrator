require "rspec"
require "rspec/given"
require "rake"

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
  config.color = true
end

def run_task(task)
  Rake.application.invoke_task task
  Rake::Task.tasks.each(&:reenable)
end
