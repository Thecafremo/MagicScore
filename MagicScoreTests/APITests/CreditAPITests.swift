//
//  CreditAPITests.swift
//  MagicScoreTests
//
//  Created by Thecafremo on 13/2/18.
//  Copyright © 2018 Magic Dealers. All rights reserved.
//

import XCTest
@testable import MagicScore

private enum MockRequestError: Error {
    case failed
}

class CreditAPITests: XCTestCase {
    
    //MARK: - Tests.
    
    func testRetrieveWithValidResponse() {
        
        let mockRequestManager = MockRequestManager()
        mockRequestManager.throwingReturnClosure = {
            return self.creditResponseData()
        }
        
        CreditAPI.retrieve(through: mockRequestManager ) { (throwingReturnClosure: ThrowingReturnClosure<Credit>) in
            
            do {
             
                guard let credit = try throwingReturnClosure(), let creditReportInfo = credit.creditReportInfo else {
                    
                    XCTFail()
                    return
                }
                
                XCTAssertTrue(creditReportInfo.clientRef != nil)
                XCTAssertTrue(creditReportInfo.maxScoreValue != nil)
                XCTAssertTrue(creditReportInfo.minScoreValue != nil)
                
            } catch {
                XCTFail()
            }
        }
    }
    
    
    func testRetrieveWithError() {
        
        let mockRequestManager = MockRequestManager()
        mockRequestManager.throwingReturnClosure = {
            throw MockRequestError.failed
        }

        CreditAPI.retrieve(through: mockRequestManager ) { (throwingReturnClosure: ThrowingReturnClosure<Credit>) in
            
            do {
                
                _ = try throwingReturnClosure()
                XCTFail()

            }  catch {
                return
            }
        }
    }
    
    
    //MARK: - Helpers.
    
    private func creditResponseData() -> Data {
        
        let path = Bundle(for: type(of: self)).path(forResource: "Credit", ofType: "json")!
        return try! Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
    }
}
