//
//  TheBarUITests.swift
//  TheBarUITests
//
//  Created by Bruno Meneghin on 14/01/21.
//

import XCTest

class TheBarUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testShowBeerDetails() throws {
        let _ = XCUIApplication().launch()
        XCUIApplication().tables/*@START_MENU_TOKEN@*/.cells.containing(.staticText, identifier:"Trashy Blonde")/*[[".cells.containing(.staticText, identifier:\"4.1\")",".cells.containing(.staticText, identifier:\"Trashy Blonde\")"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.staticTexts["Alcohol content"].tap()
    }
    
    func testScrollingBeerDetails() {
        let _ = XCUIApplication().launch()
        XCUIApplication().tables/*@START_MENU_TOKEN@*/.staticTexts["Electric India"]/*[[".cells.staticTexts[\"Electric India\"]",".staticTexts[\"Electric India\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeUp()
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
