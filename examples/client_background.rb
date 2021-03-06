require 'rubygems'
#require 'gearman'
require '../lib/gearman'

servers = ['localhost:4730',]
  
client = Gearman::Client.new(servers)
taskset = Gearman::TaskSet.new(client)

task = Gearman::Task.new('sleep', 20, { :background => true })
task.on_complete {|d| puts d }

taskset.add_task(task)
taskset.wait(100)
