module LanguageServer
  module Protocol
    module Interface
      class VersionedTextDocumentIdentifier < TextDocumentIdentifier
        def initialize(uri:, version:)
          @attributes = {}

          @attributes[:version] = version

          @attributes.freeze
        end

        #
        # The version number of this document.
        #
        # @return [number]
        def version
          attributes.fetch(:version)
        end

        attr_reader :attributes

        def to_json(*args)
          attributes.to_json(*args)
        end
      end
    end
  end
end
