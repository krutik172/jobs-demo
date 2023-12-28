namespace :resque do
  desc 'Start Resque Scheduler'
  task start_scheduler: :environment do
    require 'resque/scheduler'

    # Load the schedule if needed
    Resque.schedule = YAML.load_file(File.join(Rails.root, 'config', 'resque_schedule.yml'))

    # Start the scheduler
    Resque::Scheduler.verbose = true
    Resque::Scheduler.run
  end
end
