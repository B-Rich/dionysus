module Dionysus
  module Bot
    class Metadata
      attr_reader :name, :content

      def initialize(attrs = {})
        @name = attrs["name"]
        @content = attrs["content"]
      end
    end
  end
end
