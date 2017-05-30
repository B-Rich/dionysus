require "dionysus/bot/passages"
require "dionysus/bot/solr_document"
require "dionysus/bot/warning_index"

module Dionysus
  module Bot
    class IndexDocumentPayload
      attr_reader :converted_document, :solr_document, :status, :warnings

      def initialize(attrs = {})
        @converted_document = Dionysus::Bot::Passages.new(attrs["converted_document"])
        @solr_document = Dionysus::Bot::SolrDocument.new(attrs["solr_document"])
        @status = attrs["status"]
        @warnings = []
        build_warnings(attrs["warnings"])
      end

      def build_warnings(warnings)
        warnings.each do |warning|
           @warnings << Dionysus::Bot::WarningIndex.new(warning)
        end
      end
    end
  end
end
