import Cocoa
import Combine

/*
 
 
 ["A","B","C","D"].publisher.sink {
 print($0)
 }
 
 ["A","B","C","D"].publisher.collect().sink {
 print($0)
 }
 
 ["A","B","C","D","E","F"].publisher.collect(3).sink {
 print($0)
 }
 
 
 let formatter = NumberFormatter()
 formatter.numberStyle = .spellOut
 
 [1230, 456, 78, 9].publisher.map {
 formatter.string(from: NSNumber(integerLiteral: $0)) ?? ""
 }.sink {
 print($0)
 }
 
 
 ["A","B","C","D",nil,"E"].publisher.replaceNil(with: "NoData").sink {
 print($0 ?? "")
 }
 */
let numbers = (1...21).publisher

numbers.filter { $0 % 3 == 0}.sink {
    print($0)
}
