require 'rails_helper'

RSpec.describe 'Api::CertificatesSources', type: :request do
  let(:headers) { { 'Authorization-Token': 'true' } }

  describe 'POST' do
    context 'when correct source file is provided' do
      let(:params) { { source_file: Rack::Test::UploadedFile.new(file_fixture('example_certifications_source.csv').to_path, 'text/csv') } }

      it 'creates new CertificatesSource object with the uploaded file' do
        expect { post '/api/certificates_sources', headers: headers, params: params }.to change { CertificatesSource.count }.by(1)
        expect(CertificatesSource.last.source_file.present?).to be_truthy
      end

      it 'schedules ProcessCertificatesSourceJob' do
        expect { post '/api/certificates_sources', headers: headers, params: params }.to have_enqueued_job(ProcessCertificatesSourceJob)
      end

      describe 'response' do
        before { post '/api/certificates_sources', headers: headers, params: params }

        it 'returns a 201 Created status' do
          expect(response).to have_http_status(:created)
        end

        it 'returns json content type' do
          expect(response.content_type).to eq('application/json; charset=utf-8')
        end

        it 'returns json with created certificates source id' do
          parsed_response = JSON.parse(response.body)
          expect(parsed_response['id']).to eq(CertificatesSource.last.id)
        end
      end
    end

    context 'when source file is not valid' do
      let(:params) { { source_file: Rack::Test::UploadedFile.new(Tempfile.new('incorrect_file').path, 'text/plain') } }

      before { post '/api/certificates_sources', headers: headers, params: params }

      it 'returns 400 Bad Request' do
        expect(response).to have_http_status(:bad_request)
      end

      it 'returns json content type' do
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end

      it 'returns json with error messages' do
        parsed_response = JSON.parse(response.body)
        expect(parsed_response['errors']['source_file']).to include('has an invalid content type')
      end
    end
  end
end
