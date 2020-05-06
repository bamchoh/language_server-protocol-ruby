module LanguageServer
  module Protocol
    module Interface
      class CompletionParams < TextDocumentPositionParams
        def initialize(text_document:, position:, context: nil)
          @attributes = {}

          @attributes[:textDocument] = text_document
          @attributes[:position] = position
          @attributes[:context] = context if context

          @attributes.freeze
        end

        #
        # The completion context. This is only available if the client specifies
        # to send this using `ClientCapabilities.textDocument.completion.contextSupport === true`
        #
        # @return [CompletionContext]
        def context
          attributes.fetch(:context)
        end

        attr_reader :attributes

        def to_hash
          attributes
        end

        def to_json(*args)
          to_hash.to_json(*args)
        end
      end
    end
  end
end
