
import Foundation

open class CabbageStore<State: CabbageStateType>: StoreType {

    typealias SubscriptionType = SubscriptionBox<State>

    // swiftlint:disable todo
    // TODO: Setter should not be public; need way for store enhancers to modify appState anyway
    // swiftlint:enable todo

    /*private (set)*/ public var state: State! {
        didSet {
            subscriptions = subscriptions.filter { $0.subscriber != nil }
            subscriptions.forEach {
                $0.newValues(oldState: oldValue, newState: state)
            }
        }
    }

    public var dispatchFunctionCabbage: CabbageDispatchFunction!

    public var dispatchFunction: DispatchFunction! {
        get {
            assert(true, "Can not reach \"dispatchFunction\"!")
            return nil
        }
    }

    private var reducer: CabbageReducer<State>

    var subscriptions: [SubscriptionType] = []

    private var isDispatching = false

    public required init(
        reducer: @escaping CabbageReducer<State>,
        state: State?,
        middleware: [CabbageMiddleware<State>] = []
        ) {
        self.reducer = reducer

        // Wrap the dispatch function with all middlewares
        self.dispatchFunctionCabbage = middleware
            .reversed()
            .reduce({ [unowned self] action in
                return self._defaultDispatch(action: action)
            }) { dispatchFunction, middleware in
                // If the store get's deinitialized before the middleware is complete; drop
                // the action without dispatching.
                let dispatch: (CabbageAction) -> Void = { [weak self] in self?.dispatch($0) }
                let getState = { [weak self] in self?.state }
                return middleware(dispatch, getState)(dispatchFunctionCabbage)
        }

        if let state = state {
            self.state = state
        } else {
            dispatch(CabbageInit())
        }
    }

    public required init(
        reducer: @escaping Reducer<State>,
        state: State?,
        middleware: [Middleware<State>] = []
        ) {
        assert(true, "Can not reach \"init(reducer: @escaping Reducer<State>, state: State?, middleware: [Middleware<State>] = [])\"!")

        self.reducer = reducer

    }

    open func subscribe<S: StoreSubscriber>(_ subscriber: S)
        where S.StoreSubscriberStateType == State {
            _ = subscribe(subscriber, transform: nil)
    }

    open func subscribe<SelectedState, S: StoreSubscriber>(
        _ subscriber: S, transform: ((Subscription<State>) -> Subscription<SelectedState>)?
        ) where S.StoreSubscriberStateType == SelectedState
    {
        // If the same subscriber is already registered with the store, replace the existing
        // subscription with the new one.
        if let index = subscriptions.index(where: { $0.subscriber === subscriber }) {
            subscriptions.remove(at: index)
        }

        // Create a subscription for the new subscriber.
        let originalSubscription = Subscription<State>()
        // Call the optional transformation closure. This allows callers to modify
        // the subscription, e.g. in order to subselect parts of the store's state.
        let transformedSubscription = transform?(originalSubscription)

        let subscriptionBox = SubscriptionBox(
            originalSubscription: originalSubscription,
            transformedSubscription: transformedSubscription,
            subscriber: subscriber
        )

        subscriptions.append(subscriptionBox)

        if let state = self.state {
            originalSubscription.newValues(oldState: nil, newState: state)
        }
    }

    open func unsubscribe(_ subscriber: AnyStoreSubscriber) {
        if let index = subscriptions.index(where: { return $0.subscriber === subscriber }) {
            subscriptions.remove(at: index)
        }
    }

    // swiftlint:disable:next identifier_name
    open func _defaultDispatch(action: CabbageAction) {
        guard !isDispatching else {
            raiseFatalError(
                "ReSwift:ConcurrentMutationError- Action has been dispatched while" +
                    " a previous action is action is being processed. A reducer" +
                    " is dispatching an action, or ReSwift is used in a concurrent context" +
                " (e.g. from multiple threads)."
            )
        }

        isDispatching = true
        let newState = reducer(action, state)
        isDispatching = false

        state = newState
    }

    open func dispatch(_ action: CabbageAction) {
        dispatchFunctionCabbage(action)
    }

    open func dispatch(_ action: Action) {
        assert(true, "Can not reach \"dispatch(_ action: Action)\"!")
    }

    open func dispatch(_ actionCreatorProvider: @escaping ActionCreator) {
        if let action = actionCreatorProvider(state, self) {
            dispatch(action)
        }
    }

    open func dispatch(_ asyncActionCreatorProvider: @escaping AsyncActionCreator) {
        dispatch(asyncActionCreatorProvider, callback: nil)
    }

    open func dispatch(_ actionCreatorProvider: @escaping AsyncActionCreator,
                       callback: DispatchCallback?) {
        actionCreatorProvider(state, self) { actionProvider in
            let action = actionProvider(self.state, self)

            if let action = action {
                self.dispatch(action)
                callback?(self.state)
            }
        }
    }

    public typealias DispatchCallback = (State) -> Void

    public typealias ActionCreator = (_ state: State, _ store: CabbageStore) -> CabbageAction?

    public typealias AsyncActionCreator = (
        _ state: State,
        _ store: CabbageStore,
        _ actionCreatorCallback: @escaping ((ActionCreator) -> Void)
        ) -> Void
}

// MARK: Skip Repeats for Equatable States

extension CabbageStore where State: Equatable {
    open func subscribe<S: StoreSubscriber>(_ subscriber: S)
        where S.StoreSubscriberStateType == State {
            _ = subscribe(subscriber, transform: { $0.skipRepeats() })
    }
}
