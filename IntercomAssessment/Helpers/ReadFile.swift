
import Foundation

struct ReadFile {
    //Reading the file line by line since the entire file as a whole is not vaild json
    //customers aren't in an array or key value pair that I can map to
    //So this function reads the entire file as a string
    //and then creates an array in which each line is an element in the array
    func lineByLineAsString(_ filename: String, _ type: String) -> [String]? {
        if let filePath = Bundle.main.path(forResource: filename, ofType: type) {
            if let lines = try? String(contentsOfFile: filePath,encoding: .utf8) {
                //filtering out any empty lines since xcode adds
                //a empty line at the end of the text files 
                let linesArray = lines.components(separatedBy: .newlines).filter({!$0.isEmpty})
                return linesArray
            } else {
                print("Error reading file as string")
                return nil
            }
        } else {
            print("File not found")
            return nil
        }
    }
}
