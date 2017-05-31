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

  describe ".index_a_document" do
    before :each do
      stub_response = ExampleIndexADocumentResponce.new
      allow(Dionysus::Bot::DocumentConversion).to receive(:post).and_return(stub_response)
      allow(File).to receive(:new).and_return("")
    end

    it "should retrun a instance of type Dionysus::Bot::IndexDocumentPayload" do
      expect(Dionysus::Bot::DocumentConversion.index_a_document(document: "")).to be_kind_of(Dionysus::Bot::IndexDocumentPayload)
    end
  end

end

class ExampleConvertDocumentResponse
  def body
    '{
      "source_document_id": "",
      "timestamp": "2015-10-12T20:16:15.535Z",
      "media_type_detected": "application/pdf",
      "metadata": [{
        "name": "publicationdate",
        "content": "2015-07-18"
      }],
      "answer_units": [{
        "id": "de93c979-414b-4967-afd5-21eafeaedf69",
        "type": "regular",
        "title": "Title from your document 1",
        "content": [{
          "media_type": "text/plain",
          "text": "Text from your document 2"
        }]
      }, {
        "id": "f3702667-9133-4e9d-a639-fbfc70822b9c",
        "type": "regular",
        "title": "Title from your document 3",
        "content" :[{
          "media_type": "text/plain",
          "text": ""
        }]
      }],
      "warnings": []
    }'
  end

  def success?
    true
  end
end

class ExampleIndexADocumentResponce
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
