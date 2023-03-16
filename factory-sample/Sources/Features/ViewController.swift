import CoreRepository
import Factory
import UIKit

public class ViewController: UIViewController {
    private var viewModel: ViewModel!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = Container.shared.viewModel(5)
    }
    
    @IBAction private func didTapShowButton(_ sender: Any) {
        Task {
            let text = await viewModel.getText()
            print("text: \(text)")
        }
    }
}

public extension ViewController {
    static func make() -> ViewController {
        StoryboardScene.Main.initialScene.instantiate()
    }
}
