//
//  SlideDownMenuUITests.swift
//  SlideDownMenuUITests
//
//  Created by Kevin Vishal Saldanha on 16/09/20.
//  Copyright © 2020 TuffyTiffany. All rights reserved.
//

import XCTest
@testable import SlideDownMenu
//
enum LaunchModeType : String {
    case mainScreen = "Main"
}

struct UITestConstant {
    static let initialVC = "initialVC"
}

class SlideDownMenuUITests: XCTestCase {
    
    var app : XCUIApplication!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        app = XCUIApplication()
        
        // UI tests must launch the application that they test.
        
        app.launchEnvironment = [UITestConstant.initialVC : LaunchModeType.mainScreen.rawValue]
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testCategoryButtons() throws {
        // UI tests must launch the application that they test.
        app.launch()
        
        let categoryButtonId = "category_btn"
        let categoryButton = app.otherElements.buttons.element(matching: .button, identifier: categoryButtonId)
        XCTAssertTrue(categoryButton.exists, "Category button is not found in UI")
        
        let automobileButtonId = "automobile_btn"
        let automobileButton = app.otherElements.buttons.element(matching: .button, identifier: automobileButtonId)
        XCTAssertTrue(automobileButton.exists, "Automobile button is not found in UI")
        
        let sportsButtonId = "sports_btn"
        let sportsButton = app.otherElements.buttons.element(matching: .button, identifier: sportsButtonId)
        XCTAssertTrue(sportsButton.exists, "Sports button is not found in UI")
        
        let electronicsButtonId = "sports_btn"
        let electronicsButton = app.otherElements.buttons.element(matching: .button, identifier: electronicsButtonId)
        XCTAssertTrue(electronicsButton.exists, "Electronics button is not found in UI")
        
        let furnitureButtonId = "sports_btn"
        let furnitureButton = app.otherElements.buttons.element(matching: .button, identifier: furnitureButtonId)
        XCTAssertTrue(furnitureButton.exists, "Furniture button is not found in UI")
        
        let kitchenButtonId = "sports_btn"
        let kitchenButton = app.otherElements.buttons.element(matching: .button, identifier: kitchenButtonId)
        XCTAssertTrue(kitchenButton.exists, "Kitchen button is not found in UI")
    }
    
    func testButtonClicks() throws {
        app.launch()
        
        let categoryButtonId = "category_btn"
        let categoryButton = app.otherElements.buttons.element(matching: .button, identifier: categoryButtonId)
        categoryButton.tap()
        XCTAssert(categoryButton.waitForExistence(timeout: 0.8))
        categoryButton.tap()
        
        let automobileButtonId = "automobile_btn"
        let automobileButton = app.otherElements.buttons.element(matching: .button, identifier: automobileButtonId)
        XCTAssert(automobileButton.waitForExistence(timeout: 0.8))
        automobileButton.tap()
        
        let sportsButtonId = "sports_btn"
        let sportsButton = app.otherElements.buttons.element(matching: .button, identifier: sportsButtonId)
        XCTAssert(sportsButton.waitForExistence(timeout: 0.8))
        sportsButton.tap()
        
        let electronicsButtonId = "sports_btn"
        let electronicsButton = app.otherElements.buttons.element(matching: .button, identifier: electronicsButtonId)
        XCTAssert(electronicsButton.waitForExistence(timeout: 0.8))
        electronicsButton.tap()
        
        let furnitureButtonId = "sports_btn"
        let furnitureButton = app.otherElements.buttons.element(matching: .button, identifier: furnitureButtonId)
        XCTAssert(furnitureButton.waitForExistence(timeout: 0.8))
        furnitureButton.tap()
        
        let kitchenButtonId = "sports_btn"
        let kitchenButton = app.otherElements.buttons.element(matching: .button, identifier: kitchenButtonId)
        XCTAssert(kitchenButton.waitForExistence(timeout: 0.8))
        kitchenButton.tap()
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
