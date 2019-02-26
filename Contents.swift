import Cocoa

protocol TalkerDelegate {
    var name: String { get }
    
    func doListening( sender: Talker )
}

class Listener: TalkerDelegate {
    var name: String
    
    init( name: String , talker: Talker ) {
        self.name = name
        talker.delegate = self
    }
    
    func attachAsDelegate( talker: Talker ) {
        talker.delegate = self
    }
    
    func doListening( sender: Talker ) {
        print( "I am \(self.name) and I listened. \(sender.name) talked to me." )
    }
    
    
}

class Talker {
    var delegate: TalkerDelegate?
    var name: String

    init( name: String ) {
        self.name = name
    }
    
    func talkToListener() {
        print( "I am \(self.name). I am talking to \(delegate?.name ?? "no one" )." )
        delegate?.doListening(sender: self)
    }
    
}

var firstTalker = Talker( name: "First Talker" )
var secondTalker = Talker( name: "Second Talker" )
var thirdTalker = Talker( name: "Third Talker" )
var fourthTalker = Talker( name: "Fourth Talker" )

var firstListener = Listener( name: "First Listener" , talker: firstTalker )
var secondListener = Listener( name: "Second Listener" , talker: secondTalker )

secondListener.attachAsDelegate(talker: thirdTalker )

firstTalker.talkToListener()
secondTalker.talkToListener()
thirdTalker.talkToListener()
fourthTalker.talkToListener()
