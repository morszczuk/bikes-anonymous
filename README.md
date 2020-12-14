# Bikes Anonymous

Example Rails API for a company providing certifications for cyclists.

## Requirements
Ruby `2.7.1`
Rails `6.1.0`
Postgres
## Installation
`bin/setup`

### User Story 1 - Upload of certifications file
1. Firstly, setup and start the app ( by running the command `bin/setup`).
2. In the app directory, run following requests

- Correct, authorized request:
`curl -H 'Authorization-Token: present' -F source_file=@./spec/fixtures/files/example_certifications_source.csv http://localhost:3000/api/certificates_sources`

- Unauthorized request:
`curl -F import_file=@./spec/fixtures/files/example_certifications_source.csv http://localhost:3000/api/certificates_sources`

### User Story 2 - Generate Certificate PDF

1. Start the app.
2. Enter `http://localhost:3000/rails/mailers/pdf_certificate_mailer` - it will show a preview of the email, with the certificate as attached pdf. The data is randomly generated after every reload.
