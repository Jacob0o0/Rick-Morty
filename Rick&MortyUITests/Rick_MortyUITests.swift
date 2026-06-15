//
//  Rick_MortyUITests.swift
//  Rick&MortyUITests
//
//  Created by Jacobo Escorcia on 13/06/26.
//

import XCTest

final class Rick_MortyUITests: XCTestCase {
    private var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false
    
        app = XCUIApplication()
        app.launchArguments.append("UITests")
        app.launch()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    @MainActor
    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    @MainActor
    func testLaunchPerformance() throws {
        // This measures how long it takes to launch your application.
        measure(metrics: [XCTApplicationLaunchMetric()]) {
            XCUIApplication().launch()
        }
    }
    
    func testAddAndRemoveFavoriteFlow() {

            // Verificar pestaña Personajes
            let charactersTab = app.tabBars.buttons["Personajes"]
            XCTAssertTrue(charactersTab.waitForExistence(timeout: 5))
            charactersTab.tap()

            // Abrir primer personaje
            let firstCharacter = app.buttons["character_1"]
            XCTAssertTrue(firstCharacter.waitForExistence(timeout: 10))
            firstCharacter.tap()

            // Agregar a favoritos
            let favoriteButton = app.buttons["favoriteButton"]
            XCTAssertTrue(favoriteButton.waitForExistence(timeout: 5))
            favoriteButton.tap()

            // Ir a Favoritos
            let favoritesTab = app.tabBars.buttons["Favoritos"]
            XCTAssertTrue(favoritesTab.waitForExistence(timeout: 5))
            favoritesTab.tap()

            // Verificar favorito
            let favoriteCell = app.otherElements["favorite_1"]
            XCTAssertTrue(
                favoriteCell.waitForExistence(timeout: 5)
            )

            // Eliminar favorito
            favoriteCell.swipeLeft()
            let deleteButton = app.buttons["Delete"]
            XCTAssertTrue(deleteButton.exists)
            deleteButton.tap()

            // Verificar eliminación
            XCTAssertFalse(favoriteCell.waitForExistence(timeout: 2))

        }
}
