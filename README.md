[![Code Climate](https://codeclimate.com/github/IcaliaLabs/dionysus/badges/gpa.svg)](https://codeclimate.com/github/IcaliaLabs/dionysus)
[![Test Coverage](https://codeclimate.com/github/IcaliaLabs/dionysus/badges/coverage.svg)](https://codeclimate.com/github/IcaliaLabs/dionysus/coverage)
[![Issue Count](https://codeclimate.com/github/IcaliaLabs/dionysus/badges/issue_count.svg)](https://codeclimate.com/github/IcaliaLabs/dionysus)
![Made with Love by Icalia Labs](https://img.shields.io/badge/With%20love%20by-Icalia%20Labs-ff3434.svg)

<div style="text-align:center">
  <img src="assets/logo.png" width="980">
</div>

Dionysus is an open source ruby gem that acts as a wrapper for IBM Watson's [Document conversion service API](https://www.ibm.com/watson/developercloud/document-conversion.html).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'dionysus'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dionysus

## Usage

### Configuration

In order for Dionysus to work correctly, it is important that you [set up an IBM Bluemix account of your own](https://console.ng.bluemix.net/) and that your trial period hasn't ended (or, for that matter, that you've registered for a paid account)

First require the `dionysus-bot` in your file:

```ruby
require 'dionysus-bot'
```

Then add the following configuration block:

```ruby

Dionysus::Bot.configure do |config|
	config.username = SOME_USERNAME
	config.password = SOME_PASSWORD
	config.base_uri = "https://gateway.watsonplatform.net/document-conversion/api/v1"
end
```

**Note: The username and password are not your Bluemix credentials. These
credentials are specific to the Document Conversion API and must
be obtained from said section of Watson's Docs**

### Convert a document

In order to convert a document, simply use the `Dionysus::Bot::DocumentConversion` class' convert_document method:

```ruby
Dionysus::Bot::DocumentConversion.convert_document(document: "/Users/Documents/sample.pdf")
```

`Dionysus::Bot::DocumentTones.convert_document` method returns an instance of `Dionysus::Bot::ConvertDocumentPayload`, an example of this can be seen below:

```
#<Dionysus::Bot::ConvertDocumentPayload:0x007f802ba86f08 @source_document_id="", @timestamp="2017-05-31T21:23:27.282Z", @media_type_detected="application/pdf", @metadata=[#<Dionysus::Bot::Metadata:0x007f802ba86e68 @name="Content-Type", @content="text/html; charset=UTF-8">, #<Dionysus::Bot::Metadata:0x007f802ba86e40 @name="publicationdate", @content="2017-05-23">], @answer_units=[#<Dionysus::Bot::AnswerUnit:0x007f802ba86e18 @id="35752382-ca5f-4371-a26d-36b425ffa17e", @type="h1", @parent_id="", @title="Hello World", @direction="ltr", @content=[#<Dionysus::Bot::Content:0x007f802ba86dc8 @media_type="text/plain", @text="">]>], @warnings=[#<Dionysus::Bot::WarningConvert:0x007f802ba86da0 @phase="answer_units", @warning_id="no_selector_tag_match", @description="Only one answer unit was produced because none of the selector_tags [h1, h2, h3, h4, h5, h6] matched against the document.">]>
```

### Index a document

In order to index a document, simply use the `Dionysus::Bot::DocumentConversion` class' index_a_document method:

```ruby
Dionysus::Bot::DocumentConversion.index_a_document(document: "/Users/jorge/Documents/Icalia/Olympus/Other/example.html",config: '{"convert_document":{"normalized_html":{"exclude_tags_completely":["script","sup","link"],"exclude_tags_keep_content":["font","em","span","strong","code"],"keep_content":{"xpaths":["//section[@class=\"columns large-11 body\"]"]},"exclude_content":{"xpaths":["//div[@class=\"footer-nav\"]","//section[@class=\"bodySection\"]/h3","/body/div/section/section/p[2]"]},"exclude_tag_attributes":["EVENT_ACTIONS","class"]}},"retrieve_and_rank":{"dry_run":true}}', metadata: '{"metadata":[{"name":"Creator","value":"Some person"},{"name":"Subject","value":"Application programming interfaces"}]}'))
```

`Dionysus::Bot::DocumentTones.index_a_document` method returns an instance of `Dionysus::Bot::IndexDocumentPayload`, an example of this can be seen below:

```
#<Dionysus::Bot::IndexDocumentPayload:0x007f802b1fe700 @converted_document=#<Dionysus::Bot::Passages:0x007f802b1fe6d8 @media_type_detected="text/html", @metadata=[#<Dionysus::Bot::Metadata:0x007f802b1fe638 @name="Content-Type", @content="text/html; charset=UTF-8">, #<Dionysus::Bot::Metadata:0x007f802b1fe610 @name="Content-Style-Type", @content="text/css">, #<Dionysus::Bot::Metadata:0x007f802b1fe5e8 @name="Generator", @content="Cocoa HTML Writer">, #<Dionysus::Bot::Metadata:0x007f802b1fe5c0 @name="CocoaVersion", @content="1504.83">], @answer_units=[], @warnings=[]>, @solr_document=#<Dionysus::Bot::SolrDocument:0x007f802b1fe598 @body=nil, @content_html=nil, @title=nil>, @status=nil, @warnings=[#<Dionysus::Bot::WarningIndex:0x007f802b1fe548 @phase="convert_document", @warning_id="xpath_not_found", @description="The specified XPath '//div[@class=\"footer-nav\"]' was not found in the given document.">, #<Dionysus::Bot::WarningIndex:0x007f802b1fe520 @phase="convert_document", @warning_id="xpath_not_found", @description="The specified XPath '//section[@class=\"bodySection\"]/h3' was not found in the given document.">, #<Dionysus::Bot::WarningIndex:0x007f802b1fe4f8 @phase="convert_document", @warning_id="xpath_not_found", @description="The specified XPath '/html/body/div/section/section/p[2]' was not found in the given document.">, #<Dionysus::Bot::WarningIndex:0x007f802b1fe4d0 @phase="convert_document", @warning_id="xpath_not_found", @description="The specified XPath '//section[@class=\"columns large-11 body\"]' was not found in the given document.">, #<Dionysus::Bot::WarningIndex:0x007f802b1fe4a8 @phase="convert_document", @warning_id="empty_input_to_converter", @description="The input provided to the converter phase is empty or doesn't contain text that can be converted.">]>
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/dionysus. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
