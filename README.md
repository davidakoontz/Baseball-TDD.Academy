#  Baseball-TDD-Kata-Swift5 Release v1.0 Starter Project

## This code is being TDD.Academy test driven - follow along on https://www.twitch.tv/tddacademy
## YouTube Channel: https://www.youtube.com/channel/UCU1U6oPscxzKd_IWAIOm60w/featured

## Next Show (Jan 22)
ToDo: 

Note: automatic advancement of runners on base - now the order of calls to advance runners matters.

Adding other atBat types…

## Jan 18th
- [x] Move Play method runnerOn(base, action) into Game class.
    Requires: getting current Play from Inning and setting RunnerOutcomes
    Requires: Play.whosOn() moving to Game also.
- [x] Counting of score (Visitor & Home) in Struct on Game.score.
    Also:
    Play.called() >> umpCalled();  runnerOn() >> playRunnerOn() - and deprecated ;;
    LineUp.next() >> nextBatterInLineUp() ... to distinguish from other nextBatter methods.
    Inning.appendTop() .appendBottom() made private - use .append( play, teamAtBat)
    made a Score struct to hold visitor & home Ints.
    Game.runnerOn() is preferred method now - not play.runnerOn
    move the if-test for which inning half into the Inning class;  made a append method that takes a Team parameter.
    added game as parameter to inning init.
    added properties: game & play to Inning class; as well as Inning.append() & Inning.currentPlay()
    added EmptyPlay class
    added EmptyInning class
    Turned on Code Coverage tool in project.
    
## Jan 11th
LineUp is a RingBuffer - that does NOT cycle like I want.
Made a new LineUp class and used it.

Move Play method runnerOn(base, action) into Game class.

## Jan 9 & 10th
Refactoring Play init.
Recognizing the poor Play() initialization with an outcome; removed the AtBat from the init()
Which rippled thru all test….
Created a method  Play.called(AtBat) 	// umpires call each play

Refactoring all classes to have “default” Access Level (not Public)

Pushed to GitHub

Play object is needing to keep track of the runners on base - the game situation 
So the new called() method will be responsible for putting batter’s on base
Yet what moves the runners - they should move before the batter.


GREEN  - do I refactor issues above?
	Options:
- [x] 	1) make Game the owner of bases and base info (NOT a Refactoring)
        - [x] Move enums into Game (from Play)
        - [x] Copy runnerOutcomes into Game
        - [x] Make a nextBatter() factory for Play
        - [x] Split RunnerOutcomes - move Bases into Game
        - [x] Rename runnerAdvances to runnerOn(base, action)
        - [x] runnerOutcomes - need each base line (4)
- [x] 	2) player == method	(Close to Refactoring) >> now use it!
- [x] 	5) move EmptyPlayer to Player file
- [x] 	9) runnerOutcomes are strings - make them RunnerAction type
- [x] 	10) move Game-runnerActions to Play
- [x] 	3) baseOutcomes are strings… move into Game  (NOT Refactoring)
- [x] 	4) Play needs access to Game - maybe Game is a Play Factory (NOT Refactor)
- [x] 	12) new init() for Play that allows an AtBat for static init. - capability for real data in view.
- [x]  13) whichInning() whichHalf() methods
- [x]  14) change Inning.number : String to be named label.
- [x] 	11) when Plays are created they should be appended to an Inning
- [x] 	6) add another play type (new Test) - bases loaded and a WALK should Score Run.
- [x] 	8) unit test RingBuffer (found on Net) used for lineUp in Game
        - [x] 15) RingBuffer read didn’t wrap around on 10th read. << FIXME


In doing all of this above - I lost the static rich data of AtBat records that the running example game used on screen…. To get back that info of AtBat - added another init() method that takes the AtBat outcome of Play class.  Now the display canvas & example App have data that is rich and shows the AtBat info.


## Jan 8th 2021

Continuing the handling of runner actions & outcomes.  - rename Play.whosonbase - so that it reads aPlay.whosOn().thirdBase

- testAssociatedRunnerScoresARun
- When a runner on third base advances to home - they score a run (we have yet to track that).
- When a runner on first advances to second - they are no longer on first - it’s empty and second is held by them.



## Dec 30th
Topics for Today’s show:
 - User Stories 
 - Code Review - some of the off line changes
	- delete unused classes/files
	- Enums AtBat (types of Plays) & Position (type of player)
 - Maybe a bit of year end RETROSPECTIVE?? - big picture Project
	- when will we be shipping something (see User Stories)
 - Finish the refactoring of AtBat from inside of the Player? Is it DONE?

 - add Footer:  
 - add Game.score (sums each inning score) for a total
 - rename ContentView to ScorecardView…



——
Updates made - off camera - before Dec 30.

Cleaned up the classes we have not used yet.  So maybe the paper card modeling session got way too far ahead of our design.

Deleted classes:  PlayGenerator, FieldSimulator, Scorecard etc.  example JSON file (that Lance will not let me use :^)

Renamed the func:  getInning ->> createInning  

Access permission on classes - private properties…

Making Inning class properties private:
 - have to add getters for top & bottom
 - Inning class doubles in line count - just for some simple access control - that really does nothing… instead of direct access (firstInning.top.appent(play) we get to access firstInning.appentTop(play) ) that’s not any better - that I can see.



## Dec 23rd
Last time we refactored the AtBat string out of the Player class into the Play class.

Innings has a list of Players (was OK - but… now… needs to be a list of Plays)
Off-screen… Added Enum Positions & AtBats
We need a Game class with a list of innings; innings have a top half & bottom half which are list of plays (Play class).

OO breaking encapsulation ( Inning class has File/Default Access - not Private)

Tailor Swift’s keynote on Clean Code…
Lance’s Playground … example code - Clean Code / Primitive Obsession  “CaveMan Funk” story of marketing to primitive obsession - by Lancer Kind.
SOLID Principles - Robert (Uncle Bob) Martin

Access Control in Swift (the Open/Closed Principle in SOLID)
https://learnappmaking.com/access-control-visibility-swift-how-to/

Do we want a Game or do we use Scorecard???
Grouping mechanism ==> Game WINNS! We create a game class.

Started with GameTest.swift for the Game.swift class.


Next Step:  keep working on AtBat … it’s in the display.  DONE!
Number out of the Inning init().  We don’t have a Factory for creating Innings yet.
Not using Scorecard … deleted.

Shippable product yet???


## Dec 18th
Migrate the Player property atBat to somewhere else… it does not belong in Player and causes some issues.

Use Scorecard.swift and compose Player and AtBats  (Play array) in the score card.

￼

In ContentView let’s delete the if for game.isEmpty - 

Pulling code from GitHub you get Swift Compile Error: No such module ViewInspector.
Fix: switch to ViewInspector target and build - then switch back…
https://www.twitch.tv/videos/846428993?filter=highlights&sort=time

Remove AtBat string from Player class - moving it into Play (unused now).

ContentView is using the Player array to display it’s data.

Where to start???

Remove or Ad - which first??  We chose Ad - atBats to the Play class first.

Does Play have a property or what??

Tailor Swift intrulude…. We have a PlayTest….

In Test Cases :: expected comes first - then the ACTUAL

Did the Require of Description parameter… (this was a mistake) 
XCT order of the expected vs actual does not matter... XCT is agnostic on order!

Question about ScorecardTest or PlayerTest ???

Delete the PlayerRowView.swith & test.  

## Dec 13th

I’ve noticed I had the Home Team batting first in an Inning - well that’s just poor behavior - the Visiting team always bats first.

Speaking of code that’s not going to production - an empty Player array - don’t thing we will ever see a game with that case - so commented out that test.  Also it was causing an problem… interesting didn’t go down that habit hole. But it will come back to bit me…

In our attempt to init the Inning class - with a bogus Zeroth element - got confused between the Inning (zeroth) and the Player array in top & bottom.  Figured out a way to init the top & bottom array with a Zeroth Player - but in reality I don’t care if the player’s array starts at zero… it is the Innings I wanted to match up with the names First, Second etc.

We added protocols Hashable & Identifiable to Player - for the ForEach but didn’t test them.


Running all test ..  Thread Fatal error: index out of range:  game[1].top.  It’s that  Inning vs Player confusing…
For now I’m ditching the concept of inning array index 1 == first inning; going to count from ZERO.

Several failing test… many having to do with finding Player EMPTY HEAD - since this is not the proper concern - I’m getting rid of the Init code to create EMPTY HEAD.  That helped - now only ONE failing test in InningTest.  A test that is relying on Static data… bad programmer!  Moving that data into the test.

Got back to ALL GREEN.  Now clean up some of the above.

- [ ] Test Player hash - got too complex
- [ ] Better name for Inning top & bottom => playerAtBats but need home/visitor in there.
- [ ] Currently using array for Innings - would like to have first == 1
- [ ] Get rid of class static values in test - do inline setup
- [ ] How to move code from test to setup???
- [x] Changed Bob Swift number to 8 (as 2 was causing Fatal Error : each layout item may only occur once in refactored ContentView’s playerRowView ForEach) seems that the player number is used as unique hash.
- [x] Get rid of Player EMPTY HEAD
- [x] Visitors batting FIRST.
- [x] Test Player ==



## Dec 11th Scroll thru all At Bats of a Game
Dec  11th on TDD.Academy - Baseball (world) Series

Last time we discussed the advantages of ViewInspector with the author of that testing library Alexey - that was a good show, lots of knowledge in that to unpack.



An Xcode Pro-Tip go to twitter and search for:  “@twostraws Xcode tip”

Today we are going to try to get multiple innings of both teams showing up in a Scroll View of the basic At Bat layout.

￼
 Here’s our current At Bat of a Player, Jonathan (the second-baseman - 4) getting a base hit.

Our next user story:  Scroll through all At Bats of a Game.  I’d like to see the two teams distinguished (maybe background color or text color) extra points for displaying the Inning #s and Game Summary at the end of the list.

A BDD style example:
Given a known game record (perhaps a JSON file or string) of Teams Swifties vs Java Ol Skool;
When the roster and At Bat records of all plays is known;
Then the App displays a scrolling list of At Bat records and a Summary with the Winning team in larger font and the score:
 For example:  “Swifties 6 vs Java Ol Skool 3”
 
 
## Nov 25th Renamed files & folders & project
Removed "TDD" from file names and most of source/tests 

## Nov 20th TDD.Academy Live
Let's review what READING the Guide could teach us about ViewInspector.
Where to Next:  I started down a strict TDD tiny steps path of wanting a TEST to prove the ContentView has a
PlayerRowView with a player displayed.  This results in some learning... several Test FAIL and I have 
yet another HACK to make the player an empty array.  I need to be able to INJECT (pass on construction)
the player to the View.
Next: get ContentView to display multiple players in a List

## Nov 14th Doh'  - Reading the Guide.md of ViewInspector
Gee,  picky software <scarsim> it could not handle me skipping Step 2:
   extension ContentView: Inspectable {}    // don't skip this step!
And we also learned that we needed to use the class name in traversing the View hiearchy like:
   let prView = try cView.inspect().view(PlayerRowView.self)     // << magic ViewInspector sauce

## Nov 13th TDD.Academy Live via Twitch.TV
Wrote some more test to test PlayerRowView.swift (a view for each player in our stream/file) but
could NOT figure out how to inspect the "custom View" class with ViewInspector.  Tried lots of stuff and may have gotten everyone confused.  Lesson to learn here is... RTFM (Read The F.... fine Manual).

## Nov 12th ViewInspector - for TDD to make QUICK tests.
Wrote some Test After code (what does one call that style - it's not TDD... its TAD = Test After Design?)
But we have proven that the ViewInspector can work to speed up the validation of the UI Views.
Examples:  Baseball-TDDTests/SimpleTDDViewTests.swift & /PlayerRowViewTests.swift

## Nov 8th
Let's try to install https://github.com/nalexn/ViewInspector 
Swift Package Manager

In Xcode select File ⭢ Swift Packages ⭢ Add Package Dependency...
Copy-paste repository URL: https://github.com/nalexn/ViewInspector
Hit Next two times, under Add to Target select your test target. There is no need to add it to the build target.
Hit Finish

Learn to use the Inspector:  https://github.com/nalexn/ViewInspector/blob/master/guide.md


## Nov 6th 
We tried to fix the Scorecard test that we left unfinished last time... Got the test to GREEN and started refactoring the toString() *JAVA* code to use the Swifty CustomStringConvertible protocol.  All was going great when the newbie's couldn't figure out how to use the stinking thing... after a bit of fumbling about - we punted!   {come to find out - we just needed the String(describing: card) paramerter name in the call.}

So then we moved on to reading in a JSON file as a Player object - using the Bundle extension from Paul Hudson - Hacking with Swift.
Looked briefly (way-too-long) at the FieldView code to draw a baseball field on the screen.
Talked about the PlayerRowView - a nicely formated row of data for each Player object.
And then discussed and pondered on how to test a JSON data object/file and what to use inside of test.  Seems we have options that I just don't fully understand the cost benefits of each:  - Static Data like Player.example; the data.json file;  a network URL resource of JSON; a "data-object" like a string-blob; maybe others.
We also discussed and pondered on how to test a Swift View - like PlayerRowView... which is very simple to look at and say - yeah that looks good... but maybe impossible to automate a test to do it...
{ and this is where the learning happens }

Lance is suggesting that experience tells him to solve the testing problem of slow-UI-test early (NOW!) and not wait for the mud-hole to get as wide as the mississippi river.

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

