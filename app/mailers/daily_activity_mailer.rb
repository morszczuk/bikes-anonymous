class DailyActivityMailer < ApplicationMailer
  def send_summary(recipient, target_day, **activities_summary)
    @certificates_sources_activities = activities_summary[:certificates_sources]
    @certificates_activities = activities_summary[:certificates]

    mail(to: recipient, subject: "BA activies summary for #{target_day}")
  end
end
