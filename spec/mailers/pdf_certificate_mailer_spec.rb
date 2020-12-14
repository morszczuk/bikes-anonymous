require 'rails_helper'

RSpec.describe PdfCertificateMailer, type: :mailer do
  describe 'send_certificate' do
    let(:certificate) { build(:certificate) }
    let(:generated_certificate_pdf) { ::Certificates::PdfCertificateGenerator.call(**certificate.attributes) }

    let(:mail) { PdfCertificateMailer.send_certificate(certificate.email, generated_certificate_pdf) }

    it 'sets the headers' do
      expect(mail.subject).to eq('BA cycling certificate')
      expect(mail.to).to eq([certificate.email])
    end

    it 'has the certificate file attached' do
      expect(mail.attachments.size).to eq(1)
      expect(mail.attachments.first.filename).to eq('certificate.pdf')
    end
  end
end
