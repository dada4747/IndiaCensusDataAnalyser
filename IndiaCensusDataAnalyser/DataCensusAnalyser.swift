//
//  DataCensusAnalyser.swift
//  IndiaCensusDataAnalyser
//
//  Created by gadgetzone on 09/07/21.
//

import Foundation
enum ExceptionType: Error {
    case UNABLE_TO_PARSE
    case WRONG_FILE_DELIMETER
    case INVALID_HEADER
      
    }
struct CensusData {
    var State: String = ""
    var Population: Int
    var AreaInSqKm:Int
    var DensityPerSqKm:Int
}

var censusData = [CensusData]()

func dataCensusAnalyserFunc(from csvName: String, fileType file: String) throws -> Int {

    guard let filepath = Bundle.main.path(forResource: csvName, ofType: file) else {
        throw ExceptionType.UNABLE_TO_PARSE
    }
    
    var data = ""
    do {
        data = try String(contentsOfFile: filepath)
    } catch {
            print(error)
    }
    //now split that string into an array of "rows" of data.  Each row is a string.
    var rows = data.components(separatedBy: "\n")
    //if you have a header row, remove it here
    rows.removeFirst()

    //now loop around each row, and split it into each of its columns
    for row in rows {
        let columns = row.components(separatedBy: ",")
        
        //check that we have enough columns
        if columns.count == 4 {
            let state = columns[0]
            let population = Int(columns[1]) ?? 0
            let areaInSqKm = Int(columns[2]) ?? 0
            let densityPerSqKm = Int(columns[3]) ?? 0

            let details = CensusData(State: state, Population: population, AreaInSqKm: areaInSqKm, DensityPerSqKm: densityPerSqKm)
            censusData.append(details)
        } else {
            throw ExceptionType.INVALID_HEADER
        }
    }
    return censusData.count
}
