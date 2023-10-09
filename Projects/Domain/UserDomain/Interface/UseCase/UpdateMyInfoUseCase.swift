import Combine

public protocol UpdateMyInfoUseCase {
    func execute(req: UpdateMyInfoRequestDTO) -> AnyPublisher<Void, Error>
}
