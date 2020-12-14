require 'factory_bot'
# Preview all emails at http://localhost:3000/rails/mailers/daily_activity_mailer
class DailyActivityMailerPreview < ActionMailer::Preview
  def send_summary
    activities_summary = { certificates_sources: { new: 15, succesfully_processed: 7, partially_processed: 5, failed: 3 },
                           certificates:         { entries: 5439, generated_and_sent: 5209, failed: 20 } }
    admin_email = FactoryBot.build(:admin).email
    DailyActivityMailer.send_summary(admin_email, '06/01/21', **activities_summary)
  end
end
