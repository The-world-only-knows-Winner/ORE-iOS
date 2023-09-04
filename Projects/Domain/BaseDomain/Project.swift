import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.module(
    name: ModulePaths.Domain.BaseDomain.rawValue,
    targets: [
        .implements(module: .domain(.BaseDomain), product: .framework, dependencies: [
            .SPM.Moya,
            .SPM.CombineMoya,
            .core(target: .JwtStore, type: .interface),
            .shared(target: .GlobalThirdPartyLibrary),
            .shared(target: .UtilityModule)
        ]),
        .tests(module: .domain(.BaseDomain), dependencies: [
            .domain(target: .BaseDomain)
        ])
    ]
)
