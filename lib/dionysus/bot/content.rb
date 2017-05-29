module Dionysus
  module Bot
    class Content
      attr_reader :media_type, :text

      def initialize(attrs = {})
        @media_type = attrs["media_type"]
        @text = attrs["text"]
      end
    end
  end
end
