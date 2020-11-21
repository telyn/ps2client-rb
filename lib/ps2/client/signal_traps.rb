require "ps2/client/em_runner"

Signal.trap("INT") do
  puts "Caught interrupt, stopping..."
  EmRunner.exit!(125)
  EM.stop_event_loop if EM.reactor_running?
end

Signal.trap("TERM") do
  puts "Caught TERM signal, stopping..."
  EmRunner.exit!(125)
end
