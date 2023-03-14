import Foundation
import CoreSource

public protocol Repository {
    var text: String { get }
    var date: Date { get }
    
    func repeatText(_ count: Int) async -> String
}

public class SampleRepository: Repository {
    private let dataSource: DataSource
    
    public init(dataSource: DataSource) {
        self.dataSource = dataSource
    }
    
    public var text: String {
        dataSource.text
    }
    
    public var date: Date {
        dataSource.date
    }
    
    public func repeatText(_ count: Int) async -> String {
        dataSource.repeatText(count)
    }
}

public extension SampleRepository {
    convenience init() {
        self.init(dataSource: SamplelDataSource())
    }
}
