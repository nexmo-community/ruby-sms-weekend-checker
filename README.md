# Check If It Is The Weekend Web Scraping App

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)

This is a Ruby on Rails web app that scrapes once a day [isittheweekend.com](https://isittheweekend.com) to find out if today is the weekend and sends an update to all subscribers via SMS using the Nexmo SMS API.

## Prerequisites

* Ruby on Rails
* A Nexmo account
* A Nexmo phone number

## Installation

To install this application:

* Clone this repository locally
* Run `bundle install` and `rake db:migrate` from the command line

## Usage

### Running Locally

To use this application:

* Set up a [Nexmo account](https://dashboard.nexmo.com/sign-up?utm_source=DEV_REL&utm_medium=github&utm_campaign=ruby-sms-weekend-checker)
* Purchase a Nexmo phone number
* Start your [ngrok server](https://ngrok.io) from the command line
* Update your number's webhook address in the [Nexmo Dashboard](https://dashboard.nexmo.com) to your ngrok URL
  * i.e. `https://my-ngrok-url.ngrok.io/webhooks/event`
* Copy the `.env.sample` file to `.env` and fill in the values for the variables
  * `NEXMO_API_KEY`: Your Nexmo API key
  * `NEXMO_API_SECRET`: Your Nexmo API secret 
  * `FROM_NUMBER`: Your Nexmo provisioned phone number
* Run `whenever --update-crontab` from the command line to set up the daily scraping task 
* Start your Rails server
* Visit `localhost:3000` in your browser and add your phone number on the form
* As long as your web server is running you will receive a once-daily SMS message

### Deploying to Heroku

* Click the `Deploy to Heroku` button on the top
* Set up the environment variables when prompted and complete set up
* Once it is set up, schedule the Rake `scraper:check_site_update` task using the [Heroku Scheduler](https://devcenter.heroku.com/articles/scheduler)

## License

This project is under the [MIT License](LICENSE)
