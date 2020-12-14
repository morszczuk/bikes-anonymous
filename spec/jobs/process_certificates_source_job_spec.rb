require 'rails_helper'

RSpec.describe ProcessCertificatesSourceJob, type: :job do
  let(:certificates_source) { create(:certificates_source) }

  describe '#perform_now' do
    it 'finds source and calls source processor' do
      expect(::CertificatesSources::SourceProcessor).to receive(:call).with(certificates_source)

      ProcessCertificatesSourceJob.perform_now(certificates_source.id)
    end
  end
end
