# Oyster Card

It's dangerous to go alone! Take this.

**Receives Oyster card**

This is a simple command line program that simulates using an Oyster card from TfL.

The user can perform several actions:

 - Top up the card
 - Touch in and out of stations
 - View their recent journeys

The user will also get an error if they try to add too much money to the card (limit is £90). The program was developed using the TDD process, via the [rspec gem](https://rubygems.org/gems/rspec/versions/3.7.0). The tests are located in the spec folder.

## Requirements

Install Pry to be able to interact with the program - [Install Pry](https://www.preparetocode.io/mac/essential/pry.html)

## Setup

In your command line (such as Terminal or iTerm) cd to the oyster-card directory, then open Pry

```
$ pry
```
The program is located in the lib folder, so require it like so:
```
pry(main)> require './lib/oystercard.rb'
```
Finally to start, create a new Oystercard to play with:
```
card = Oystercard.new
=> #<Oystercard:0x00007f87ddadda88 @balance=0, @journeys=[]>
```

## Example use


By default, the card starts empty, so try topping it up. It will show the new balance automatically:
```
> card.top_up(10)
=> 10
```
Time to go on an adventure! Let's try travelling on the Victoria Line from Brixton to Oxford Circus. We start by adding our starting station:
```
> card.touch_in("Brixton")
=> true
```
During the journey we can ensure we are still travelling using #in_journey?:
```
> card.in_journey?
=> true
```
After reaching our destination we can then exit the station by touching out, specifying our destination station ie. "Oxford Circus":
```
card.touch_out("Oxford Circus")
=> nil
```
The (sadly unrealistically) cheap journey only cost £1. Let's check our current balance:
```
> card.balance
=> 9
```
We can see a history of our journey too:
```
> card.journeys
=> [{"Brixton"=>"Oxford Circus"}]
```
Finally we want to make sure we add plenty of money to our card, let's say £100:
```
> card.top_up(100)
RuntimeError: You can not have more than 90 on your card
```
We receive an error as the maximum balance is £90.
