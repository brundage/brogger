class Brogger
  class TimestampFormatter < ::Logger::Formatter

    def call(severity, time, progname, msg)
      format % [ time.utc.iso8601, progname, $$, severity, msg2str(msg) ]
    end


    def format
      "%s [%s.%d] %5s: %s\n"
    end


    def msg2str(*)
      super.strip
    end

  end
end
