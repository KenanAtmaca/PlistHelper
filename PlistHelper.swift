//
//
//  Copyright © 2018 Kenan Atmaca. All rights reserved.
//  kenanatmaca.com
//
//

import UIKit

class PlistHelper: NSObject {
        
    func writePlist<T:Codable>(to plist:String, encode:T, completion: @escaping (_ flag:Bool) -> ()) {
        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml
        
        do {
            let data = try encoder.encode(encode)
            try data.write(to: self.getDocumentURL(name: plist))
            completion(true)
        } catch {
            completion(false)
        }
    }
    
    func getDocPlist<T:Codable>(to plist:String, decode:T) -> T? {
        if let xmlData = FileManager.default.contents(atPath: self.getDocumentURL(name: plist).path),
            let model = try? PropertyListDecoder().decode(T.self, from: xmlData) {
            return model
        }
        return nil
    }
    
    func getPlist<T:Codable>(name:String, decode:T) -> T? {
        if let bundle = Bundle.main.path(forResource: name, ofType: "plist"),
            let xmlData = FileManager.default.contents(atPath: bundle),
            let model = try? PropertyListDecoder().decode(T.self, from: xmlData) {
            return model
        }
        return nil
    }
    
    func getPlist(name:String) -> Any? {
        if let bundle = Bundle.main.path(forResource: name, ofType: "plist"),
            let xmlData = FileManager.default.contents(atPath: bundle) {
            if let arrayList = try? PropertyListSerialization.propertyList(from: xmlData, options: .mutableContainers, format: nil) {
               return arrayList
            }
        }
        return nil
    }
    
    func getDocumentURL(name:String) -> URL {
        let docPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        return docPath.appendingPathComponent(name)
    }
}
