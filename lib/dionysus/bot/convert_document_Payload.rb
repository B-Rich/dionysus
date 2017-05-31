require "dionysus/bot/answer_unit"
require "dionysus/bot/metadata"
require "dionysus/bot/warning_convert"


module Dionysus
  module Bot
    class ConvertDocumentPayload
      attr_reader :source_document_id, :timestamp, :media_type_detected, :metadata, :answer_units, :warnings

      def initialize(attrs = {})
        @source_document_id = attrs["source_document_id"]
        @timestamp = attrs["timestamp"]
        @media_type_detected = attrs["media_type_detected"]
        @metadata = []
        @answer_units = []
        @warnings = []
        build_metadata(attrs["metadata"]) if attrs["metadata"] != nil
        build_answer_units(attrs["answer_units"]) if attrs["answer_units"] != nil
        build_warnings(attrs["warnings"]) if attrs["warnings"] != nil
      end

      def build_metadata(metadata_arr)
        metadata_arr.each do |metadata|
           @metadata << Dionysus::Bot::Metadata.new(metadata)
        end
      end

      def build_answer_units(answer_units)
        answer_units.each do |answer_unit|
          @answer_units << Dionysus::Bot::AnswerUnit.new(answer_unit)
        end
      end

      def build_warnings(warnings)
        warnings.each do |warning|
          @warnings << Dionysus::Bot::WarningConvert.new(warning)
        end
      end
    end
  end
end
