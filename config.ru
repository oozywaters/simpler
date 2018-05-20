require_relative 'config/environment'
require_relative 'lib/middleware/logger'

use SimplerLogger, path: 'log/app.log'
run Simpler.application
