require 'brogger/version'

class Brogger < ::Logger

  autoload :TimestampFormatter, File.join('brogger','timestamp_formatter')
  autoload :Null, File.join('brogger','null')

  LEVEL_MAPPING = { debug: DEBUG,     # Low-level information for developers
                    error: ERROR,     # A handleable error condition
                    fatal: FATAL,     # An unhandleable error that results in a program crash
                    info: INFO,       # Generic (useful) information about system operation
                    unknown: UNKNOWN, # An unknown message that should always be logged
                    warn: WARN        # A warning
                  }

  def initialize(*)
    super
    self.formatter = TimestampFormatter.new
  end


  def level=(l)
    super (l.is_a?(Symbol) ? level_mapping.fetch(l, UNKNOWN) : l)
  end


private

  def level_mapping; LEVEL_MAPPING; end

end
