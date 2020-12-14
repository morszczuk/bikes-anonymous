module Api
  class CertificatesSourcesController < ::Api::ApiBaseController
    def create
      certificates_source = CertificatesSource.create(source_file: params[:source_file])

      if certificates_source.persisted? && ProcessCertificatesSourceJob.perform_later(certificates_source.id)
        render json: { id: certificates_source.id, message: 'Source file scheduled for processing.' }, status: :created
      else
        render json: { errors: certificates_source.errors.messages }, status: :bad_request
      end
    end
  end
end
