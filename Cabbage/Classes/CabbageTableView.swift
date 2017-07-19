
import UIKit

public protocol CabbageTableView: UITableViewDelegate, UITableViewDataSource {

    var cells: [[CabbageTableViewCellModel]]? { get set }
    var headers: [CabbageTableViewHeaderFooterModel]? { get set }
    var footers: [CabbageTableViewHeaderFooterModel]? { get set }
}

extension CabbageTableView {

    // MAKR:- DataSource
    // MARK: Cell
    func numberOfSections(in tableView: UITableView) -> Int {
        return cells?.count ?? 0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells?[section].count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var value: UITableViewCell?
        if let model = cells?[indexPath.section][indexPath.row],
            let cell = tableView.dequeueReusableCell(withIdentifier: model.reuseIdentifier()) as? CabbageTableViewCell {
            cell.setModel(with: model)
            value = cell as? UITableViewCell
        }
        return value ?? UITableViewCell()
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return cells?[indexPath.section][indexPath.row].estimatedHeight ?? CGFloat.closeToZero()
    }

    // MARK: Header
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return headers?[section].title
    }

    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return headers?[section].estimatedHeight ?? CGFloat.closeToZero()
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var value: UIView?
        if let model = headers?[section],
            let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: model.reuseIdentifier()) as? CabbageTableViewHeaderFooterView {
            view.setModel(with: model)
            value = view as? UIView
        }
        return value ?? UIView()
    }

    // MARK: Footer
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return footers?[section].title
    }

    func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        return footers?[section].estimatedHeight ?? CGFloat.closeToZero()
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        var value: UIView?
        if let model = footers?[section],
            let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: model.reuseIdentifier()) as? CabbageTableViewHeaderFooterView {
            view.setModel(with: model)
            value = view as? UIView
        }
        return value ?? UIView()
    }
}
