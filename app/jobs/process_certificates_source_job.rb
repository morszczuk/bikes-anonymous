class ProcessCertificatesSourceJob < ApplicationJob
  queue_as :certificates_sources

  def perform(source_id)
    ::CertificatesSources::SourceProcessor.call(CertificatesSource.find(source_id))
  end
end
