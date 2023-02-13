//
//  TestTemplateTests.swift
//  TestTemplateTests
//
//  Created by Sergio García Vargas on 10/02/23.
//

import XCTest
@testable import TestTemplate

final class TestTemplateTests: XCTestCase {
    var sut: Misc!
    override func setUp() {
        super.setUp()
        sut = Misc()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testFunctionTransformDateToShowSuccess() throws {
        //given
        let testDate = "2020-06-1T00:00:00-0500"
        //when
        let result = sut.transformDateToShow(with: testDate)
        //then
        XCTAssertNotNil(result)
        XCTAssertEqual(result, "01 jun., 2020")
    }
    
    func testCallGetArtistsListSuccess() throws {
        //given
        let getArtistsUrl = URL(string: "\(Constants.url)/artists/top?apikey=\(Constants.apiKey)&limit=20&offset=20")!
        var request = URLRequest(url: getArtistsUrl)
        request.httpMethod = "GET"
        request.setValue("application/json; charset=utf8", forHTTPHeaderField: "Content-Type")
        let promise = expectation(description: "Call API success")
        //when
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let _ = data, error == nil, let result = response as? HTTPURLResponse else {
                print("Connection error: \(String(describing: error))")
                return
            }
            //then
            do{
                XCTAssertTrue(result.statusCode == 200)
                promise.fulfill()
            }
        }.resume()
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testCallGetArtistsListFailure() throws {
        //given
        let getArtistsUrl = URL(string: "\(Constants.url)/artistss/top?apikey=\(Constants.apiKey)&limit=20&offset=20")!
        var request = URLRequest(url: getArtistsUrl)
        request.httpMethod = "GET"
        request.setValue("application/json; charset=utf8", forHTTPHeaderField: "Content-Type")
        let promise = expectation(description: "Call API failure")
        //when
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let _ = data, error == nil, let result = response as? HTTPURLResponse else {
                print("Connection error: \(String(describing: error))")
                return
            }
            //then
            do{
                XCTAssertTrue(result.statusCode != 200)
                promise.fulfill()
            }
        }.resume()
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testCallGetArtistsListReturnSuccess() throws {
        //given
        let getArtistsUrl = URL(string: "\(Constants.url)/artists/top?apikey=\(Constants.apiKey)&limit=20&offset=20")!
        var request = URLRequest(url: getArtistsUrl)
        request.httpMethod = "GET"
        request.setValue("application/json; charset=utf8", forHTTPHeaderField: "Content-Type")
        let promise = expectation(description: "correct API response")
        //when
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil, let _ = response as? HTTPURLResponse else {
                print("Connection error: \(String(describing: error))")
                return
            }
            //then
            do{
                let artistsListEntity = try JSONDecoder().decode(ArtistsListEntity.self, from: data)
                XCTAssertNotNil(artistsListEntity)
                promise.fulfill()
            }catch let error {
                print("ERROR: \(error)")
            }
        }.resume()
        waitForExpectations(timeout: 5)
    }
    
}
