class EmRunner
  def self.exit!(code)
    EM.stop_event_loop if EM.reactor_running?
    @exit_code = code
  end

  def self.exit_code
    @exit_code || 0
  end
end
