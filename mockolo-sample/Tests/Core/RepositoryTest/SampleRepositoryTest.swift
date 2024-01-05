import CoreSource
import Mocks
import Nimble
import XCTest
@testable import CoreRepository

final class SampleRepositoryTest: XCTestCase {
     private var dataSource: DataSourceMock!
     private var repository: SampleRepository!
    
    override func setUp() async throws {
        dataSource = .init()
        repository = .init(dataSource: dataSource)
    }
    
    override func tearDown() async throws {
        repository = nil
    }

     func testText() throws {
         dataSource.text = "test1"
         expect(self.repository.text) == "test1"
         
         dataSource.text = "test2"
         expect(self.repository.text) == "test2"
     }

     func testRepeatText() async throws {         
         dataSource.repeatTextHandler = { _ in
             "testtesttest"
         }
         let actual = await repository.repeatText(3)
         expect(actual) == "testtesttest"
         expect(self.dataSource.repeatTextCallCount) == 1
         expect(self.dataSource.repeatTextArgValues) == [3]
     }
}
