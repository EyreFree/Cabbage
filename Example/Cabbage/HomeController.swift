
import UIKit
import Cabbage
import SnapKit

class HomeController: CabbageTableViewController, CabbageStoreSubscriber {

    var homeStore: CabbageStore<HomeState>?

    let tableView = UITableView(frame: CGRect.zero, style: .grouped)
    let textField = UITextField()
    let addButton = UIButton(type: .system)

    override var cells: [[CabbageTableViewCellModel]]? {
        get {
            return store().state.nameList
        }
        set(newValue) {
            if let newValue = newValue as? [[HomeCellModel]] {
                store().state.nameList = newValue
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(HomeCell.self, forCellReuseIdentifier: HomeCellModel().reuseIdentifier())

        store().subscribe(self)
        addControls()
    }

    func addControls() {
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        self.view.addSubview(textField)
        textField.snp.makeConstraints {
            (make) in
            make.left.equalTo(1)
            make.right.equalTo(-81)
            make.top.equalTo(11)
            make.height.equalTo(48)
        }

        addButton.layer.borderColor = UIColor.black.cgColor
        addButton.layer.borderWidth = 1
        addButton.setTitle("Add", for: .normal)
        addButton.addTarget(self, action: #selector(addClick), for: .touchDown)
        self.view.addSubview(addButton)
        addButton.snp.makeConstraints {
            (make) in
            make.right.equalTo(-1)
            make.height.equalTo(48)
            make.width.equalTo(78)
            make.top.equalTo(11)
        }

        tableView.dataSource = self
        tableView.delegate = self
        tableView.showsVerticalScrollIndicator = false
        tableView.bounces = true
        tableView.alwaysBounceVertical = true
        tableView.isScrollEnabled = true
        tableView.backgroundColor = UIColor.clear
        tableView.separatorColor = UIColor.clear
        //tableView.tableFooterView = UIView(frame: CGRect.zero)
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        //tableView.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints {
            (make) in
            make.left.right.bottom.equalTo(0)
            make.top.equalTo(60)
        }
    }

    func newState(state: HomeState) {
        tableView.reloadData()
    }

    func addClick(_ sender: AnyObject) {
        let xxx = HomeCellModel()
        xxx.title = textField.text ?? ""
        store().dispatch(ListActionAdd(newLine: xxx))
    }
}

extension HomeController {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        store().dispatch(ListActionClick(index: indexPath.row))
    }
}
