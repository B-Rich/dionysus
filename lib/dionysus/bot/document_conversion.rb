require "dionysus/bot/convert_document_payload"

module Dionysus
  module Bot
    class DocumentConversion < Olimpo::Base
      def self.convert_document(params = {})
        input_file = File.new(params[:document])
        response = post("/convert_document?version=2015-12-15", body: { file: input_file, config: { conversion_target: "ANSWER_UNITS" }.to_json })

        parsed_response = JSON.parse(response.body)

        return Dionysus::Bot::ConvertDocumentPayload.new(parsed_response) if response.success?

        raise_exception(response.code, response.body)
      end
    end
  end
end
