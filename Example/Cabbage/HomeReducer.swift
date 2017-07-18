
import Cabbage

extension HomeController {
    public static func counterReducer(action: CabbageAction, state: HomeState?) -> HomeState {
        var state = state ?? HomeState()

        switch action {
        case _ as CounterActionIncrease:
            state.counter += 1
        case _ as CounterActionDecrease:
            state.counter -= 1
        default:
            break
        }

        printLog(state.counter)

        return state
    }
}
