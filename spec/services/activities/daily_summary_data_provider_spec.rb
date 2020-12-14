require 'rails_helper'

RSpec.describe ::Activities::DailySummaryDataProvider do
  describe '.call' do
    it 'queries for CertificatesSource created in the last 24 hrs' do
      skip '[TO DO] Not yet implemented...'
    end

    it 'counts CertificatesSource with the flag :processed' do
      skip '[TO DO] Not yet implemented...'
    end

    it 'counts CertificatesSource with the flag :failed' do
      skip '[TO DO] Not yet implemented...'
    end

    it 'sums all Certificates from the CertificatesSources' do
      skip '[TO DO] Not yet implemented...'
    end

    it 'sums certificates_generated_and_sent from CertificatesSources' do
      skip '[TO DO] Not yet implemented...'
    end

    it 'sums certificates_failed from CertificatesSources' do
      skip '[TO DO] Not yet implemented...'
    end
  end
end
