/*
 Michael Kiss
 iOS Developer.  Unit 01 project.  Soccer League Coordinator.  Goal is sort the information below into 2 initail groups (experienced and inexperienced) players.  Next I want to sort them into 3 teams.  (Sharks, Dragons and Raptors).  They should have an equal number of exp and inexp players.  Ex cred - also sort them within an average height of 1.5 inches of each other.  Lastly, compose a letter to be sent to guardians informing them of which team their child has been placed on, and the time and date of the first practice.
 
 Player Data
 
 Name            Height (inches)    Soccer Experience               Guardian Name(s)
 Joe Smith             42                 YES                       Jim and Jan Smith
 Jill Tanner           36                 YES                       Clara Tanner
 Bill Bon              43                 YES                       Sara and Jenny Bon
 Eva Gordon            45                  NO                       Wendy and Mike Gordon
 Matt Gill             40                  NO                       Charles and Sylvia Gill
 Kimmy Stein           41                  NO                       Bill and Hillary Stein
 Sammy Adams           45                  NO                       Jeff Adams
 Karl Saygan           42                 YES                       Heather Bledsoe
 Suzane Greenberg      44                 YES                       Henrietta Dumas
 Sal Dali              41                  NO                       Gala Dali
 Joe Kavalier          39                  NO                       Sam and Elaine Kavalier
 Ben Finkelstein       44                  NO                       Aaron and Jill Finkelstein
 Diego Soto            41                 YES                       Robin and Sarika Soto
 Chloe Alaska          47                  NO                       David and Jamie Alaska
 Arnold Willis         43                  NO                       Claire Willis
 Phillip Helm          44                 YES                       Thomas Helm and Eva Jones
 Les Clay              42                 YES                       Wynonna Brown
 Herschel Krustofski   45                 YES                       Hyman and Rachel Krustofski
 
 Team names and their initial practice dates and times
 
 Dragons - March 17, 1pm
 Sharks - March 17, 3pm
 Raptors - March 18, 1pm
 
 */
// step 1: populate my players array with the above info
let players: [[String: Any]] = [
    ["playerName": "Joe Smith", "playerHeight": 42.0, "playerExp": true, "playerGuardian": "Jim and Jan Smith"],
    ["playerName": "Jill Tanner", "playerHeight": 36.0, "playerExp": true, "playerGuardian": "Clara Tanner"],
    ["playerName": "Bill Bon", "playerHeight": 43.0, "playerExp": true, "playerGuardian": "Sara and Jenny Bon"],
    ["playerName": "Eva Gordon", "playerHeight": 45.0, "playerExp": false, "playerGuardian": "Wendy and Mike Gordon"],
    ["playerName": "Matt Gil", "playerHeight": 40.0, "playerExp": false, "playerGuardian": "Charles and Sylvia Gill"],
    ["playerName": "Kimmy Stein", "playerHeight": 41.0, "playerExp": false, "playerGuardian": "Bill and Hillary Stein"],
    ["playerName": "Sammy Adams", "playerHeight": 45.0, "playerExp": false, "playerGuardian": "Jeff Adams"],
    ["playerName": "Karl Saygan", "playerHeight": 42.0, "playerExp": true, "playerGuardian": "Heather Bledsoe"],
    ["playerName": "Suzane Greenberg", "playerHeight": 44.0, "playerExp": true, "playerGuardian": "Henrietta Dumas"],
    ["playerName": "Sal Dali", "playerHeight": 41.0, "playerExp": false, "playerGuardian": "Gala Dali"],
    ["playerName": "Joe Kavalier", "playerHeight": 39.0, "playerExp": false, "playerGuardian": "Sam and Elaine Kavalier"],
    ["playerName": "Ben Finkelstein", "playerHeight": 44.0, "playerExp": false, "playerGuardian": "Aaron and Jill Finkelstein"],
    ["playerName": "Diego Soto", "playerHeight": 41.0, "playerExp": true, "playerGuardian": "Robin and Sarika Soto"],
    ["playerName": "Chloe Alaska", "playerHeight": 47.0, "playerExp": false, "playerGuardian": "David and Jamie Alaska"],
    ["playerName": "Arnold Willis", "playerHeight": 43.0, "playerExp": false, "playerGuardian": "Claire Willis"],
    ["playerName": "Phillip Helm", "playerHeight": 44.0, "playerExp": true, "playerGuardian": "Thomas Helm and Eva Jones"],
    ["playerName": "Les Clay", "playerHeight": 42.0, "playerExp": true, "playerGuardian": "Wynonna Brown"],
    ["playerName": "Hershel Krustofski", "playerHeight": 45.0, "playerExp": true, "playerGuardian": "Hyman and Rachel Krustofski"],
]
players.count // this is just here to confirm that I got all the players.  18.

//  This section divides the players up based on experienced. From the above list, each should be populated by 9 players
//  Was a frustrating section.  Had all kinds of problems finding a solution that did not throw an error about Any and bool.
//  Came across a hint in the swift ebook about using a switch statement.  Which, for reasons I do not currently understand,
//  the compiler accepted.

var experiencedPlayer: [[String: Any]] = []
var inexperiencedPlayer: [[String: Any]] = []

for sortPlayers in players {
    let expPlayer = sortPlayers["playerExp"]
    switch expPlayer {
    case true as Bool:  experiencedPlayer.append(sortPlayers)
    default:  inexperiencedPlayer.append(sortPlayers)
    }
}
experiencedPlayer.count
inexperiencedPlayer.count
/*
 players have been sorted correctly.  9 in each array.  Decided to pass on extra credit, as I want to move on to the next unit before xmas!  :)  Not sure if the code below qualifies as hard coding.  There are only 3 teams in the league. I tried to come up with a math equation which would work if more teams were appended to the league,, but it (really) wasn't working.  Settled on the code below because the if statement check of counter < 3... counter < 6... counter < 9 would definately be hard coded. Note:  the sort just grabs them in the array's index order.  The instructions only said that the teams should be fairly populated,not how to do it.
 */

var teamSharks: [[String: Any]] = []
var teamDragons: [[String: Any]] = []
var teamRaptors: [[String: Any]] = []
var league: [String] = ["Dragons", "Sharks", "Raptors"]

func teamAssignment () {
    var counter = 0
    let playerCount = (players.count - 1)
    while counter < playerCount {
        if counter < ((players.count / 2) * 1 / league.count) {
            teamSharks.append(experiencedPlayer[counter])
            teamSharks.append(inexperiencedPlayer[counter])
            counter += 1
        }
        else if counter < ((players.count / 2) * 2 / league.count) {
            teamDragons.append(experiencedPlayer[counter])
            teamDragons.append(inexperiencedPlayer[counter])
            counter += 1
        }
        else if counter < (players.count / 2) {
            teamRaptors.append(experiencedPlayer[counter])
            teamRaptors.append(inexperiencedPlayer[counter])
            counter += 1
        }
        else {
            break
        }
    }
}
teamAssignment()
league
/*
 All three teams have been populated by six players. Three experienced, and three inexperienced, players aside. This last section was much harder to do than it should have been.  The joy of trying to unmask a optional variable cannot be put into words.  :)  Tried MANY different ways, but when the compiler didn't crash, the word optional was ever present in my output.  I eventually got it to work, but I admit I had to google it.  Even then it was a pain.  I found I had to combine two of the online suggestions for unmasking an optional (as neither worked by itself).  First I declared two constant variables and set them equal to the dictionary entries inside their cooresponding arrays using any?.  Then I had to use an if statement setting a new variable equal to my just established constant.  It workded.  Don't know why, and I admit right now I don't care.  It just got the optional out of my letter.  Not exactly happy with the letters, but I just want to finish, and put it up on gitHub.  Maybe I'll work on them before I submit.  ok... so this is what happens when you just crank out the code without reading the grading requirements first.  :)  All letters have to be stored in one array.  So I came up with a quick fix in my code.  Added a letters array of type any.  Appended the contents of my three teams letter's arrays into the letters array, outside of the respective for loops to make sure I got all the letters.  Not sure if this will be acceptable.
 */
var dragonWelcomeLetter = ""
var sharkWelcomeLetter = ""
var raptorWelcomeLetter = ""
var letters: [Any] = []
let dragonPractice = ["March 17", "1 PM"]
let sharkPractice = ["March 17", "3 PM"]
let raptorPractice = ["March 18", "1 PM"]
var letterIndex = 0
func letterWriter() {
    for dragonPlayers in teamDragons {
        let dragonGauardian: Any? = dragonPlayers["playerGuardian"]
        let dragonPlayer: Any? = dragonPlayers["playerName"]
        if let unwrappedDragonPlayer = dragonPlayer, let unwrappedDragonGaurdian = dragonGauardian{
            dragonWelcomeLetter =  "Hello,  \(unwrappedDragonGaurdian), your child, \(unwrappedDragonPlayer), has been selected to the Dragons!  I am your coach, Peter DeBerg.  Our initial practice will begin at \(dragonPractice[letterIndex + 1]) on \(dragonPractice[letterIndex])th."
            letters.append(dragonWelcomeLetter)
        }
    }
    for sharkPlayers in teamSharks {
        let sharkGauardian: Any? = sharkPlayers["playerGuardian"]
        let sharkPlayer: Any? = sharkPlayers["playerName"]
        if let unwrappedSharkPlayer = sharkPlayer, let unwrappedSharkGaurdian = sharkGauardian {
            sharkWelcomeLetter = "Welcome \(unwrappedSharkGaurdian), your child, \(unwrappedSharkPlayer), has been chosen to play for the Sharks!  I am your coach, Jacob Molson.  Our first practice will start at \(sharkPractice[letterIndex + 1]) on \(sharkPractice[letterIndex])th."
            letters.append(sharkWelcomeLetter)
        }
    }
    for raptorPlayers in teamRaptors {
        let raptorGauardian: Any? = raptorPlayers["playerGuardian"]
        let raptorPlayer: Any? = raptorPlayers["playerName"]
        if let unwrappedRaptorPlayer = raptorPlayer, let unwrappedRaptorGaurdian = raptorGauardian {
            raptorWelcomeLetter = "Greetings to, \(unwrappedRaptorPlayer), and their family, \(unwrappedRaptorGaurdian). I want to take a second and welcome you to your team.  The Raptors.  We were champions last year.  I have no doubt that we will repeat this year.  I am Coach Dick Hatcher. Our practice season will begin at \(raptorPractice[letterIndex + 1]) on \(raptorPractice[letterIndex])th."
            letters.append(raptorWelcomeLetter)
        }
    }
}
letterWriter()
letters.count
//print(dragonWelcomeLetter)
//print(sharkWelcomeLetter)
//print(raptorWelcomeLetter)


letters.forEach() { print($0)}
//print(letters)
/*
 well, it worked.  (Just one thing left to do.  why did the print of letters run 19 instead of 18.  Don't care anymore.  Can't see the beginning of the output.  How to scroll up the lines in output at bottom of screen?)  For a first project it could've been worse.  ,)
 */

