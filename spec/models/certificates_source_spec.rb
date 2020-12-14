require 'rails_helper'

RSpec.describe CertificatesSource, type: :model do
  it { is_expected.to validate_content_type_of(:source_file).allowing('text/csv') }
end
