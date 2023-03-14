import CoreSource
import Mockingbird
import Mocks
import XCTest
@testable import CoreRepository

final class SampleRepositoryTest: XCTestCase {
    private var dataSource: DataSourceMock!
    private var repository: SampleRepository!

    override func setUpWithError() throws {
        dataSource = mock(DataSource.self)
        repository = .init(dataSource: dataSource)
    }

    override func tearDownWithError() throws {
        repository = nil
    }

    func testText() throws {
        given(dataSource.text)
            .willReturn("test1")
            .willReturn("test2")
        
        XCTAssertEqual(repository.text, "test1")
        XCTAssertEqual(repository.text, "test2")
    }
    
    func testRepeatText() async throws {
        given(dataSource.repeatText(any()))
            .willReturn("testtesttest")
        
        let actual = await repository.repeatText(3)
        XCTAssertEqual(actual, "testtesttest")
    }
}
