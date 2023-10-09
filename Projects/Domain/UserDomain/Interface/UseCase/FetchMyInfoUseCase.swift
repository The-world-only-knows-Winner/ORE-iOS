import Combine

public protocol FetchMyInfoUseCase {
    func execute() -> AnyPublisher<MyInfoEntity, Error>
}
