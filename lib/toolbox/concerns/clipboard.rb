# frozen_string_literal: true

module Toolbox
  module Concerns
    module Clipboard
      def clipboard_copy(text)
        ::Clipboard.copy(text)

        info('Text copied to clipboard !')
      end

      def clipboard_paste
        ::Clipboard.paste
      end
    end
  end
end
