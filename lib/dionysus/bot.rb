require "dionysus/version"
require "olimpo"

module Dionysus
  module Bot
    extend Olimpo
      autoload :DocumentConversation, "dionysus/bot/documentconversion"
  end
end
