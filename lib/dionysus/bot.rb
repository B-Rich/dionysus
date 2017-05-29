require "olimpo"
require "dionysus/bot/version"

module Dionysus
  module Bot
    extend Olimpo
      autoload :DocumentConversion, "dionysus/bot/document_conversion"
  end
end
