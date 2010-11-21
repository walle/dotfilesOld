# Autocomplete
require 'irb/completion'

# Colors
require 'ap'
require 'wirble'

Wirble.init
Wirble.colorize

# Save history
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"
IRB.conf[:SAVE_HISTORY] = 500

# Autoindent
IRB.conf[:AUTO_INDENT] = true

# Print SQL to STDOUT
if ENV.include?('RAILS_ENV') && !Object.const_defined?('RAILS_DEFAULT_LOGGER')
  require 'logger'
  RAILS_DEFAULT_LOGGER = Logger.new(STDOUT)
end

# Easily print methods local to an object's class
class Object
  def local_methods
    (methods - Object.instance_methods).sort
  end
end
