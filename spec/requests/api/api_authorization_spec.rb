require 'rails_helper'

RSpec.describe 'API Authorization', type: :request do
  describe 'authorization header' do
    context 'when correct header is present' do
      let(:params) { { source_file: Rack::Test::UploadedFile.new(file_fixture('example_certifications_source.csv').to_path, 'text/csv') } }

      it 'correctly processes request' do
        post '/api/certificates_sources', headers: { 'Authorization-Token': 'true' }, params: params
        expect(response).to have_http_status(:created)
      end
    end

    context 'when correct header is missing' do
      it 'returns 401 unauthorized status' do
        post '/api/certificates_sources'
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
