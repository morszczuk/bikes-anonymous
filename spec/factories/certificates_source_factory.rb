FactoryBot.define do
  factory :certificates_source do
    source_file { ::Rack::Test::UploadedFile.new('spec/fixtures/files/example_certifications_source.csv', 'text/csv') }
  end
end
