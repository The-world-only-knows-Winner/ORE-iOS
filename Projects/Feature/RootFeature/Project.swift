import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Feature.RootFeature.rawValue,
    targets: [
        .interface(module: .feature(.RootFeature)),
        .implements(module: .feature(.RootFeature), dependencies: [
            .feature(target: .BaseFeature),
            .feature(target: .RootFeature, type: .interface)
        ]),
        .tests(module: .feature(.RootFeature), dependencies: [
            .feature(target: .RootFeature)
        ])
    ]
)
