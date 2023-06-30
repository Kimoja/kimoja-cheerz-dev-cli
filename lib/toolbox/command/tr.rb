# frozen_string_literal: true

module Toolbox
  class Command
    class Tr < Toolbox::Command
      arguments(:text) { |text| text.empty? ? clipboard_paste : text * ' ' }

      def exec_en
        translate('en')
      end

      def exec_fr
        translate('fr')
      end

      def translate(target_lang)
        conn = Faraday.new(
          url: 'https://api-free.deepl.com/v2/translate',
          params: { text: arguments.text, target_lang: target_lang },
          headers: { 'Authorization' => "DeepL-Auth-Key #{api_key}" }
        )

        response = conn.post('/v2/translate')

        tr = JSON.parse(response.body)['translations'][0]['text']

        info('Translated text:')
        puts(tr)

        clipboard_copy(tr)
      end

      private def api_key
        @api_key ||= begin
          api_key = ENV[config.deepl_api_key_env_name]
          error("Missing env var #{config.deepl_api_key_env_name}", true) unless api_key

          api_key
        end
      end
    end
  end
end

