require 'rails_helper'

RSpec.describe DailyActivityMailer, type: :mailer do
  describe 'send_summary' do
    let(:admin_email) { build(:admin).email }
    let(:activities_summary) do
      { certificates_sources: { new: 15, succesfully_processed: 7, partially_processed: 5, failed: 3 },
        certificates:         { entries: 5439, generated_and_sent: 5209, failed: 20 } }
    end

    let(:mail) { DailyActivityMailer.send_summary(admin_email, '06/01/21', **activities_summary) }

    it 'sets the headers' do
      expect(mail.subject).to eq('BA activies summary for 06/01/21')
      expect(mail.to).to eq([admin_email])
    end

    it 'includes summary about certificates sources actions' do
      expect(mail.body.encoded).to match(/15 new certificates files/)
      expect(mail.body.encoded).to match(/7 were succesfully processed/)
      expect(mail.body.encoded).to match(/5 were partially processed/)
      expect(mail.body.encoded).to match(/3 failed/)
    end

    it 'includes summary about certificates actions' do
      expect(mail.body.encoded).to match(/5439 certificates/)
      expect(mail.body.encoded).to match(/5209 were succesfully generated and sent/)
      expect(mail.body.encoded).to match(/20 certificates failed/)
    end
  end
end
