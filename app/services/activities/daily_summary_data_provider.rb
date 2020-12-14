module Activities
  class DailySummaryDataProvider < ServiceBase
    def initalize(target_time)
      @target_time = target_time
    end

    def call
      # Find all new certificates files uploaded in the @target_time - 24hr.
      # Sum successful generations and failed.
      # Return results in a hash:
      # { certificates_sources: { new: 15, succesfully_processed: 7, partially_processed: 5, failed: 3 },
      #   certificates:         { entries: 5439, generated_and_sent: 5209, failed: 20 } }
      #
    end
  end
end
