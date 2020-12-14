class SendDailySummaryJob < ApplicationJob
  queue_as :daily_summary

  def perform
    summary = ::Activities::DailySummaryDataProvider.call(Time.now)

    Admin.all.pluck(:email).each do |admin_email|
      DailyActivityMailer.send_summary(admin_email, '06/01/21', **summary)
    end
  end
end
