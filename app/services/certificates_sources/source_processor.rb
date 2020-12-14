module CertificatesSources
  class SourceProcessor < ServiceBase
    def initalize(certifications_source)
      @certifications_source = certifications_source
    end

    def call
      # Read source file
      # For every certificate entry, trigger HandleCertificateJob
    end
  end
end
