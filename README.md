OK...

this is just a playground for me learning a little elm.
The idea is to create a web display of a simple yacht race.

Yachts have to get from left to right, over a 24 week time line.
Their should be some sort of "ghost ship" that shows where they would be if
on simple distance/24 weeks schedule.

Looks a bit like this:

![Screenshot of the User Interface](https://github.com/lancew/race/raw/master//race_2-2--607.png "UI Version 1")



UI... 
1. Week increment/decrement
2. Yacht 1, travel ++/--
3. Yacht 2, travel ++/--
4. Yacht 3, travel ++/--
5. Reset.

Nice to have...
1. Persistant storage in browser
2. Persistence storage via API

Lets go!!

using https://elmprogramming.com/building-a-simple-page-in-elm.html as a guide


Building:
    elm make src/HomePage.elm --output elm.js

git add, commit, push and then...

https://htmlpreview.github.io/?https://github.com/lancew/race/blob/master/index.html

^ Lets you see the page


Travis:

https://travis-ci.org/github/lancew/race

