require 'logger'
class Brogger < ::Logger
  VERSION = "0.1.0"
  def self.version; VERSION; end
end
