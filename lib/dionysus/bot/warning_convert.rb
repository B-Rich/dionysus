module Dionysus
  module Bot
    class WarningConvert
      attr_reader :phase, :warning_id, :description

      def initialize(attrs = {})
        @phase = attrs["phase"]
        @warning_id = attrs["warning_id"]
        @description = attrs["description"]
      end
    end
  end
end
