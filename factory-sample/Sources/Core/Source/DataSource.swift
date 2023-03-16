import Factory
import Foundation

public protocol DataSource {
    var text: String { get }
    var date: Date { get }
    
    func repeatText(_ count: Int) -> String
}

class SamplelDataSource: DataSource {
    var text: String {
        "Sample"
    }
    
    var date: Date {
        Date(timeIntervalSince1970: 0)
    }
    
    init() {
    }
    
    func repeatText(_ count: Int) -> String {
        Array(repeating: text, count: count).joined()
    }
}

public extension Container {
    var dataSource: Factory<DataSource> {
        self { SamplelDataSource() }
            .shared
    }
}
