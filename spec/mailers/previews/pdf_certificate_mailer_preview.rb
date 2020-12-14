require 'factory_bot'
# Preview all emails at http://localhost:3000/rails/mailers/pdf_certificate_mailer
class PdfCertificateMailerPreview < ActionMailer::Preview
  def send_certificate
    certificate_attributes = FactoryBot.build(:certificate).attributes
    generated_pdf_file = ::Certificates::PdfCertificateGenerator.call(**certificate_attributes)

    PdfCertificateMailer.send_certificate(certificate_attributes['email'], generated_pdf_file)
  end
end
