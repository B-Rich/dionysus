module Dionysus
  module Bot
    class SolrDocument
        attr_reader :body, :content_html, :title

        def initialize(attrs = {})
          @body = attrs["body"]
          @content_html = attrs["contentHtml"]
          @title = attrs["title"]
        end
    end
  end
end
