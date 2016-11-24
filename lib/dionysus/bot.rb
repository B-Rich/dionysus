require "olimpo"
require "dionysus/bot/version"
require "dionysus/bot/document_conversion"

module Dionysus
  module Bot
    extend Olimpo
      autoload :DocumentConversation, "dionysus/bot/documentconversion"
  end
end
