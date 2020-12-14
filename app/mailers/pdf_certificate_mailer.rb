class PdfCertificateMailer < ApplicationMailer
  def send_certificate(recipient, certificate_pdf_file)
    attachments['certificate.pdf'] = certificate_pdf_file.read
    mail(to: recipient, subject: 'BA cycling certificate')
  end
end
