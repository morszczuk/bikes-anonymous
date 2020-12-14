class CertificatesSource < ApplicationRecord
  has_one_attached :source_file

  validates :source_file, attached: true, content_type: :csv
end
