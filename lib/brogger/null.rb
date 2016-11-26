class Brogger
  class Null < ::Logger

    def add(severity, message = nil, progname = nil)
      yield if message.nil? && block_given?
    end

    def initialize(*args); end

  end
end
