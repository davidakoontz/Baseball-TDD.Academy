#  Baseball-TDD-Kata-Swift5 Release v1.0 Starter Project

## This code is being TDD.Academy test driven - follow along on https://www.twitch.tv/tddacademy

## Nov 6th 
We tried to fix the Scorecard test that we left unfinished last time... Got the test to GREEN and started refactoring the toString() *JAVA* code to use the Swifty CustomStringConvertible protocol.  All was going great when the newbie's couldn't figure out how to use the stinking thing... after a bit of fumbling about - we punted!   {come to find out - we just needed the String(describing: card) paramerter name in the call.}

So then we moved on to reading in a JSON file as a Player object - using the Bundle extension from Paul Hudson - Hacking with Swift.
Looked briefly (way-too-long) at the FieldView code to draw a baseball field on the screen.
Talked about the PlayerRowView - a nicely formated row of data for each Player object.
And then discussed and pondered on how to test a JSON data object/file and what to use inside of test.  Seems we have options that I just don't fully understand the cost benefits of each:  - Static Data like Player.example; the data.json file;  a network URL resource of JSON; a "data-object" like a string-blog; maybe others.
We also discussed and pondered on how to test a Swift View - like PlayerRowView... which is very simple to look at and say - yeah that looks good... but maybe impossible to automate a test to do it...
{ and this is where the learning happens }

Later that evening - I couldn't stand it ... all those Obj Modle classes being ignored... so I put them in a Model folder and the Views also...

## This release has some very very basic Baseball Object Model Classes:

- Play.swift - a message and data that gets passed around to determine the outcome
- Situation.swift - game situation # of Outs;  Balls & Strikes; etc.
- FieldSimulation.swift - definition of the field we are playing upon e.g. fence depth
- PlayGenerator.swift - to create randomize play
- Scorecard.swift - I'd like to see a classic score keepers card output for each at-Bat.

Along with some very basic TDD derived XCTest Cases - all written in XCode with Swift 5.

- Baseball-TDDTests folder
  - Baseball_TDDTests.swift
  
User Interface Test using SwiftUI 5.3 & XCode 12 
- Baseball-TDDUITests folder
 - Baseball_TDDUITests.swift

### Start here and start writing test cases - implementation code - some UI - in SwiftUI and you can have a great learning experience.

### Copyright (c) 2020 TheSwiftDojo.com  & David A. Koontz

