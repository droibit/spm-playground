import CoreRepository
import UIKit

public class ViewController: UIViewController {
    private let repository = SampleRepository()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func didTapShowButton(_ sender: Any) {
        print("text: \(repository.text)")
    }
}

public extension ViewController {
    static func make() -> ViewController {
        StoryboardScene.Main.initialScene.instantiate()
    }
}
