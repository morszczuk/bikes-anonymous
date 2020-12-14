require 'rails_helper'

RSpec.describe SendDailySummaryJob, type: :job do
  describe '#perform_now' do
    let(:admins) { create_list(:admin, 2) }
    let(:empty_summary) { { certificates_sources: {}, certificates: {} } }
    let(:target_date) { Time.zone.parse('2021-06-01') }

    before do
      allow(::Activities::DailySummaryDataProvider).to receive(:call).and_return(empty_summary)
    end

    it 'calls daily summary mailer for all admins' do
      admins.each do |admin|
        expect(::DailyActivityMailer).to receive(:send_summary).with(admin.email, '06/01/21', **empty_summary)
      end

      SendDailySummaryJob.perform_now
    end

    it 'calls daily summary data provider to get results summary data ' do
      allow(Time).to receive(:now).and_return(target_date)
      expect(::Activities::DailySummaryDataProvider).to receive(:call).with(target_date).and_return(empty_summary)

      SendDailySummaryJob.perform_now
    end
  end
end
