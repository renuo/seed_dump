require 'ipaddr'
require 'rgl/adjacency'
require 'rgl/topsort'

require 'seed_dump/dump_methods/enumeration'
require 'seed_dump/dump_methods'
require 'seed_dump/environment'
require 'seed_dump/dependency_unwrangler'

class SeedDump
  extend Environment
  extend DumpMethods

  require 'seed_dump/railtie' if defined?(Rails)
end
