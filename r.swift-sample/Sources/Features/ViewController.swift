import PKHUD
import UIKit

public class ViewController: UIViewController {
    public override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func didTapShowButton(_ sender: Any) {
        HUD.flash(.label(R.string.localizable.message()), delay: 2.0)
    }
}

public extension ViewController {
    static func make() -> ViewController {
        return R.storyboard.main.instantiateInitialViewController()!
    }
}
