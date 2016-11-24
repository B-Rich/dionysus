module Dionysus
  module Bot
    class DocumentConversion < Olimpo::Base

      def self.convert_document(params = {})
        input_file = File.new(params[:document])

        response = post("v1/convert_document?version=2015-12-15",
                        document: input_file, config: params[:config])

        return response if response.success?

        raise_exception(response.code, response.body)
      end

    end
  end
end
