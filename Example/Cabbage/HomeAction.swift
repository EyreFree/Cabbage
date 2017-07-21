
import Cabbage

extension HomeController {
    public struct ListActionAdd: CabbageAction {
        var newLine: lineModel?
    }
    public struct ListActionClick: CabbageAction {
        var index: Int?
    }
}
