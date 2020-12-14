class CreateCertificatesSources < ActiveRecord::Migration[6.1]
  def change
    create_table :certificates_sources do |t|

      t.timestamps
    end
  end
end
