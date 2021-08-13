//
//  IndiaCensusDataAnalyserTests.swift
//  IndiaCensusDataAnalyserTests
//
//  Created by gadgetzone on 09/07/21.
//

import XCTest
@testable import IndiaCensusDataAnalyser

class IndiaCensusDataAnalyserTests: XCTestCase {
    
    func testgivenIndianCensusCSVFile_shouldReturns_correctRecord() {
        let filePath = "IndiaStateCensusData"
        let csvType = "csv"
        do {
            let result = try dataCensusAnalyserFunc(from: filePath, fileType: csvType)
            XCTAssertEqual(result, 29)
        } catch {
            print(ExceptionType.UNABLE_TO_PARSE)
        }
    }
    
    func testgivenIndiaCensusData_WithWrongFile_ShouldThrowException() {
        let wrongFilePath = "IndiaStateCensusDatamosdj"
        let csvType = "csv"
        do {
            try dataCensusAnalyserFunc(from: wrongFilePath, fileType: csvType)
            XCTFail()
        } catch let error1 as ExceptionType {
            XCTAssertEqual(ExceptionType.UNABLE_TO_PARSE, error1)
        
        } catch {
            // Catch any other errors
        }

    }
    
    func testgivenIndiaCensusData_WhenWrongType_ShouldThrowException() {
        let wrongCSVFileType = "IndiaStateCensusData"
        let wrongCSVType = "txt"
        do {
            try dataCensusAnalyserFunc(from: wrongCSVFileType, fileType: wrongCSVType)
            XCTFail()
        } catch let error2 as ExceptionType {
            XCTAssertEqual(ExceptionType.UNABLE_TO_PARSE, error2)
        }catch {
            print("Another error here ")
        }
    }
    
    func testgivenIndiaStateCode_whenDelimiterIncorrect_ShouldThrowException() {
        let filePath = "IndiaStateCensusData2"
        let fileType = "csv"
        do {
            try dataCensusAnalyserFunc(from: filePath, fileType: fileType)
            XCTFail()
        } catch let error3 as ExceptionType {
            XCTAssertEqual(ExceptionType.INVALID_HEADER, error3)
        }catch {

        }
    }
    
    func testgivenIndiaCensusData_WhenHeaderIncorrect_ShouldThrowException() {
        let filePath = "IndiaStateCensusData1"
        let fileType = "csv"
        do {
            try dataCensusAnalyserFunc(from: filePath, fileType: fileType)
            XCTFail()
        } catch let error3 as ExceptionType {
            XCTAssertEqual(ExceptionType.INVALID_HEADER, error3)
        }catch {

        }
    }
}
