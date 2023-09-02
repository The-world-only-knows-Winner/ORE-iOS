import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.module(
    name: ModulePaths.Core.JwtStore.rawValue,
    targets: [
        .implements(module: .core(.JwtStore), dependencies: [
            .SPM.Moya
        ])
    ]
)
