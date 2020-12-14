module Certificates
  class PdfCertificateGenerator < ServiceBase
    ATTRIBUTES_TO_INCLUDE = %i[first_name surname email address_line_1 address_line_2 city state postcode phone].freeze

    def initialize(**attributes)
      @attributes = attributes.with_indifferent_access.slice(*ATTRIBUTES_TO_INCLUDE)
      @pdf = Prawn::Document.new
      super()
    end

    def call
      save_to_tempfile do
        render_pdf_file
      end
    end

    private

    def save_to_tempfile(&block)
      file = Tempfile.new(['certificate_pdf', '.pdf'], nil, binmode: true)
      file.write block.call
      file.rewind
      file
    end

    def render_pdf_file
      @pdf.define_grid(columns: 2, rows: @attributes.size + 1, gutter: 10)

      add_certificate_header
      add_certificate_attributes

      @pdf.render
    end

    def add_certificate_header
      @pdf.grid(0, 0).bounding_box do
        @pdf.text 'BA Certificate', style: :bold
      end
    end

    def add_certificate_attributes
      @attributes.each_with_index do |attribute, index|
        attribute.each_with_index do |attribute_part, part_index|
          @pdf.grid(index + 1, part_index).bounding_box do
            @pdf.text attribute_part.humanize
          end
        end
      end
    end
  end
end
