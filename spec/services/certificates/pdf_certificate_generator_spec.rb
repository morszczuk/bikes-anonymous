require 'rails_helper'

RSpec.describe ::Certificates::PdfCertificateGenerator do
  describe '.call' do
    let(:certificate_attributes) { attributes_for(:certificate)}

    subject { ::Certificates::PdfCertificateGenerator.call(**certificate_attributes) }

    it 'returns pdf file' do
      expect(subject.path).to match(/\.pdf/)
    end
  end
end
