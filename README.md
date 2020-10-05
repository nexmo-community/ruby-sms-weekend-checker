# Check If It Is The Weekend Web Scraping App

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/nexmo-community/ruby-sms-weekend-checker/)

This is a Ruby on Rails web app that scrapes once a day [isittheweekend.com](https://isittheweekend.com) to find out if today is the weekend and sends an update to all subscribers via SMS using the Vonage SMS API.

## Prerequisites

* Ruby on Rails
* A Vonage account
* A Vonage phone number

## Installation

To install this application:

* Clone this repository locally
* Run `bundle install` and `rake db:migrate` from the command line

## Usage

### Running Locally

To use this application:

* Set up a [Vonage account](https://dashboard.nexmo.com/sign-up?utm_source=DEV_REL&utm_medium=github&utm_campaign=ruby-sms-weekend-checker)
* Purchase a Vonage phone number
* Start your [ngrok server](https://ngrok.io) from the command line
* Update your number's webhook address in the [Vonage Dashboard](https://dashboard.nexmo.com) to your ngrok URL
  * i.e. `https://my-ngrok-url.ngrok.io/webhooks/event`
* Copy the `.env.sample` file to `.env` and fill in the values for the variables
  * `VONAGE_API_KEY`: Your Vonage API key
  * `VONAGE_API_SECRET`: Your Vonage API secret 
  * `FROM_NUMBER`: Your Vonage provisioned phone number
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
