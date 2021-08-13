//
//  ViewController.swift
//  IndiaCensusDataAnalyser
//
//  Created by gadgetzone on 09/07/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let filePath = "IndiaStateCensusData"
        let csvType = "csv"
        do {
        let result = try dataCensusAnalyserFunc(from: filePath, fileType: csvType)
        print(result)
        } catch {
            print(error)
            
        }
//        let wrongFilePath = "indiaStateCensusDataWrong"
//        do {
//            let result = try convertCSVIntoArray(from: wrongFilePath)
//            print(result)
//        } catch {
//            print(error)
//        }
//        let wrongCsvType = ""
//        //

        // Do any additional setup after loading the view.
    }


}

