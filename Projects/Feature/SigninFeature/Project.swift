import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Feature.SigninFeature.rawValue,
    targets: [
        .interface(module: .feature(.SigninFeature)),
        .implements(module: .feature(.SigninFeature), dependencies: [
            .feature(target: .BaseFeature),
            .feature(target: .SigninFeature, type: .interface)
        ]),
        .tests(module: .feature(.SigninFeature), dependencies: [
            .feature(target: .SigninFeature)
        ])
    ]
)
