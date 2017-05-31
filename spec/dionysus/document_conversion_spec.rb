require "spec_helper"

describe Dionysus::Bot::DocumentConversion do
  describe ".convert_document" do
    before :each do
      stub_response = ExampleConvertDocumentResponse.new
      allow(Dionysus::Bot::DocumentConversion).to receive(:post).and_return(stub_response)
      allow(File).to receive(:new).and_return("")
    end

    it "should return a instance of type Dionysus::Bot::ConvertDocumentPayload" do
      expect(Dionysus::Bot::DocumentConversion.convert_document(document: "")).to be_kind_of(Dionysus::Bot::ConvertDocumentPayload)
    end
  end
end

class ExampleConvertDocumentResponse
  def body
        '{
          "converted_document" : {
            "media_type_detected" : "text/html",
            "metadata" : [ {
              "name" : "Content-Type",
              "content" : "text/html; charset=UTF-8"
            }],
            "answer_units" : [ ]
          },
          "solr_document" : {
            "Generator" : "Cocoa HTML Writer",
            "Subject" : "Application programming interfaces",
            "Content-Style-Type" : "text/css",
            "CocoaVersion" : "1504.83",
            "Creator" : "Some person",
            "Content-Type" : "text/html; charset=UTF-8"
          },
          "warnings" : [ {
            "phase" : "convert_document",
            "warning_id" : "xpath_not_found",
            "description" : "The specified XPath //div[@class=\"footer-nav\"] was not found in the given document."
          }]
        }'
  end

  def success?
    true
  end
end
