//
//  MainCoordinatorSpec.swift
//  Bootcamp
//
//  Created by denis.fortuna on 16/04/21.
//

import Quick
import Nimble

@testable import Bootcamp

class MainCoordinatorSpec: QuickSpec {

    override func spec() {

        describe("MainCoordinator") {
            var sut: MainCoordinator!
            var sutStart: UIViewController!

            context("RootViewController") {

                beforeEach {
                    sut = MainCoordinator()
                    sutStart = sut.start(with: .root)
                }

                it("Coordinator returns a NavigationController with only CardsCollectionViewController in it's stack") {
                    let firstNavigationController = (sutStart as? UITabBarController)?.viewControllers?[0] as? UINavigationController
                    let secondNavigationController = (sutStart as? UITabBarController)?.viewControllers?[1] as? UINavigationController
                    
                    expect(sutStart is UITabBarController).to(equal(true))
                    expect((sutStart as? UITabBarController)?.viewControllers?.count).to(equal(2))
                    expect(firstNavigationController?.viewControllers[0] is ExpansionListViewController).to(equal(true))
                    expect(secondNavigationController?.viewControllers[0] is CardsCollectionViewController).to(equal(true))
                }
            }
        }
    }
}
