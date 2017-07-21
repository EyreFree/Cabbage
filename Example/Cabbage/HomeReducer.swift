
import Cabbage

extension HomeController {
    public static func counterReducer(action: CabbageAction, state: HomeState?) -> HomeState {
        var state = state ?? HomeState()

        switch action {
        case let actionAdd as ListActionAdd:
            if let newLine = actionAdd.newLine {
                state.nameList[0].append(newLine)
            }
        case let actionClick as ListActionClick:
            if let index = actionClick.index {
                print(index)
            }
        default:
            break
        }

        return state
    }
}
