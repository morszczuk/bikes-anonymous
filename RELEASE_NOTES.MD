# Bikes Anonymous App

## Version 1.0

### How to use it
To see how the app works for each of the stories, follow the steps described in README.

### Functionalities
1. Ability to upload a csv file containing certifications entries [US 1](https://github.com/morszczuk/bikes-anonymous/issues/2)
2. Generation of a certificate pdf and template of the certificate email [US 2](https://github.com/morszczuk/bikes-anonymous/issues/3)
2. Template of the daily summer email + example schedule for sending the emails every day at 7 am [US 3](https://github.com/morszczuk/bikes-anonymous/issues/4)

### Limitations
1. For US1, the functionalitity of actually processing the file is mocked. After uploading the certifications file, a job for handling the file is scheduled - but the step of reading a single entry from the file, creating a database object and then generating PDF and sending it - is not implemented.
2. In US2, the generation of the pdf and constructio of the email is implemented. However, because files are not actually processed in the step described in US1, that means it is not yet called in the place where it should have.
3. In US3, the mail template was implemented + example schedule. The process of gathering the data, counting the results of the processing is provided by a mocked service. This mocked data should be coming from the processing of the files - and would be defined by the jobs responsible for e.g. generating certificate pdfs.
4. US3 added an example cron, which would schedule the job, every day at 7am. At the moment the job is not scheduled though. To make it work, sidekiq and redis should ahve to be added to the project + gem sidekiq-scheduler added and configured to make use of the exampe file.
