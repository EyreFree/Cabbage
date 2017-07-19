
import UIKit
import Cabbage
import SnapKit

class HomeController: UIViewController, CabbageStoreSubscriber {
    typealias StoreSubscriberStateType = HomeState
    var homeStore: CabbageStore<HomeState>?

    let counterLabel = UILabel()
    let downButton = UIButton()
    let upButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        store().subscribe(self)
        addControls()
    }

    func addControls() {
        counterLabel.textAlignment = .center
        counterLabel.font = UIFont.systemFont(ofSize: 48)
        self.view.addSubview(counterLabel)
        counterLabel.snp.makeConstraints {
            (make) in
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.height.equalTo(64)
            make.centerY.equalTo(self.view)
        }

        downButton.setTitle("-", for: .normal)
        downButton.setTitleColor(UIColor.black, for: .normal)
        downButton.addTarget(self, action: #selector(downTouch(_:)), for: .touchUpInside)
        self.view.addSubview(downButton)
        downButton.snp.makeConstraints {
            (make) in
            make.top.equalTo(counterLabel.snp.bottom)
            make.left.equalTo(counterLabel)
            make.height.equalTo(24)
        }

        upButton.setTitle("+", for: .normal)
        upButton.setTitleColor(UIColor.black, for: .normal)
        upButton.addTarget(self, action: #selector(upTouch(_:)), for: .touchUpInside)
        self.view.addSubview(upButton)
        upButton.snp.makeConstraints {
            (make) in
            make.top.height.equalTo(downButton)
            make.left.equalTo(downButton.snp.right)
            make.right.equalTo(counterLabel)
            make.width.equalTo(downButton)
        }
    }

    func newState(state: HomeState) {
        counterLabel.text = "\(state.counter)"
    }

    func downTouch(_ sender: AnyObject) {
        store().dispatch(CounterActionDecrease());
    }

    func upTouch(_ sender: AnyObject) {
        store().dispatch(CounterActionIncrease());
    }
}
