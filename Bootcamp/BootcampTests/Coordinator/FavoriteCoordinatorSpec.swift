//
//  FavoriteCoordinatorSpec.swift
//  Bootcamp
//
//  Created by denis.fortuna on 16/04/21.
//

import Quick
import Nimble

@testable import Bootcamp

class FavoriteCoordinatorSpec: QuickSpec {

    override func spec() {

        describe("FavoriteCoordinator") {
            var sut: FavoriteCoordinator!
            var sutStart: UIViewController!

            context("RootViewController") {

                beforeEach {
                    sut = FavoriteCoordinator()
                    sutStart = sut.start(with: .push)
                }

                it("Coordinator returns a NavigationController with only CardsCollectionViewController in it's stack") {
                    expect(sutStart is UINavigationController).to(equal(true))
                    expect((sutStart as? UINavigationController)?.viewControllers.count).to(equal(1))
                    expect((sutStart as? UINavigationController)?.viewControllers[0] is CardsCollectionViewController).to(equal(true))
                }
            }
        }
    }
}
