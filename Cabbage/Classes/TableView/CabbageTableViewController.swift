
import UIKit

open class CabbageTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    open var cells: [[CabbageTableViewCellModel]]?
    open var headers: [CabbageTableViewHeaderFooterModel]?
    open var footers: [CabbageTableViewHeaderFooterModel]?
}

public extension CabbageTableViewController {

    // MAKR:- DataSource
    // MARK: Cell
    @objc(numberOfSectionsInTableView:)
    public func numberOfSections(in tableView: UITableView) -> Int {
        return cells?.count ?? 0
    }

    @objc(tableView:numberOfRowsInSection:)
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells?[section].count ?? 0
    }

    @objc(tableView:cellForRowAtIndexPath:)
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var value: UITableViewCell?
        if let model = cells?[indexPath.section][indexPath.row],
            let cell = tableView.dequeueReusableCell(withIdentifier: model.reuseIdentifier()) as? CabbageTableViewCell {
            cell.setModel(with: model)
            value = cell as? UITableViewCell
        }
        return value ?? UITableViewCell()
    }

    @objc(tableView:estimatedHeightForRowAtIndexPath:)
    public func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return cells?[indexPath.section][indexPath.row].estimatedHeight ?? CGFloat.closeToZero()
    }

    // MARK: Header
    @objc(tableView:titleForHeaderInSection:)
    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return headers?[section].title
    }

    @objc(tableView:heightForHeaderInSection:)
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return headers?[section].estimatedHeight ?? CGFloat.closeToZero()
    }

    @objc(tableView:viewForHeaderInSection:)
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var value: UIView?
        if let model = headers?[section],
            let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: model.reuseIdentifier()) as? CabbageTableViewHeaderFooterView {
            view.setModel(with: model)
            value = view as? UIView
        }
        return value ?? UIView()
    }

    // MARK: Footer
    @objc(tableView:titleForFooterInSection:)
    public func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return footers?[section].title
    }

    @objc(tableView:heightForFooterInSection:)
    public func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return footers?[section].estimatedHeight ?? CGFloat.closeToZero()
    }

    @objc(tableView:viewForFooterInSection:)
    public func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        var value: UIView?
        if let model = footers?[section],
            let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: model.reuseIdentifier()) as? CabbageTableViewHeaderFooterView {
            view.setModel(with: model)
            value = view as? UIView
        }
        return value ?? UIView()
    }
}
