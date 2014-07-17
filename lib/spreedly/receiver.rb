
module Spreedly

  class Receiver < Model

    field :receiver_type, :hostnames
    attr_reader :credentials

    def initialize(xml_doc)
      super
      init_credentials(xml_doc)
    end

    private
    def init_credentials(xml_doc)
      @credentials = {}

      xml_doc.xpath('.//credentials/credential').each do |each|
        @credentials[each.at_xpath('.//name').text] = cred_value(each)
      end
    end

    def cred_value(cred)
      value = cred.at_xpath('.//value')
      value ? value.text : nil
    end

  end

end
