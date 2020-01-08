---
layout: post
title: Point2Point (A City Exploration Game for Groups)
---
Point 2 Point is a game developed to help tourists/locals explore/ rediscover their city through narrative riddles.
Players could register a team online, enter their team phone numbers and then receive a riddle based tour through different parts of Montreal.

## Technologies
* Web Framework: [Django](https://www.djangoproject.com/)
* SMS Provider: [Twilio](https://www.twilio.com/) 

## How it Works
Once a team has registered on the website, an API driven text message service, Twilio, sends a SMS message to all team members with a starting location where their team needs to meet. Once they have arrived, they send a message back to Twilio to say they have arrived, they will then receive their first riddle, with the answer hidden somewhere in their surroundings. The team submits their answer via SMS message; if the answer is correct, they receive a cryptic clue to the next location. If they get it wrong, they receive a time penalty and a clue. 
Once the team arrives at the final location (pub or cafe) and they submit their last answer the clock stops and their time is submitted to the leaderboard on the Point2point website.   

## Future Development
This project was originally developed back in 2015, and although it got to a point that it was usable i ran into difficulties creating meaningful content for people to reliably use. 

My goal is to bring this project back to life so that I can revisit the Twilio API and possibly Django.
