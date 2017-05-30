require "dionysus/bot/content"

module Dionysus
  module Bot
    class AnswerUnit
      attr_reader :id, :type, :parent_id, :title, :direction, :content

      def initialize(attrs = {})
        @id = attrs["id"]
        @type = attrs["type"]
        @parent_id = attrs["parent_id"]
        @title = attrs["title"]
        @direction = attrs["direction"]
        @content = []
        build_content(attrs["content"])
      end

      def build_content(content_arr)
        content_arr.each do |content|
          @content << Dionysus::Bot::Content.new(content)
        end
      end
    end
  end
end
