//
//  GitHubFollowersApp.swift
//  GitHubFollowers
//
//  Created by Christopher J. Roura on 11/15/22.
//

import SwiftUI

@main
struct GitHubFollowersApp: App {
    @UIApplicationDelegateAdaptor var delegate: AppDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate, ObservableObject {
    func application(
        _ application: UIApplication,
        configurationForConnecting connectingSceneSession: UISceneSession,
        options: UIScene.ConnectionOptions
    ) -> UISceneConfiguration {
        let sceneConfig = UISceneConfiguration(name: nil, sessionRole: connectingSceneSession.role)
        sceneConfig.delegateClass = SceneDelegate.self
        
        return sceneConfig
    }
}

class SceneDelegate: NSObject, UIWindowSceneDelegate, ObservableObject {
    @Published var date: Date = .now
    
    let localeString = Locale.current.identifier(Locale.IdentifierType.cldr)
    let deviceUniqueId = UIDevice.current.identifierForVendor?.uuidString ?? ""
    
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        Timer
            .publish(every: 1, on: .main, in: .default)
            .autoconnect()
            .assign(to: &$date)
        
//        AnalyticsFacade.shared.initializePlatforms()
//        
//        AnalyticsFacade.shared.handleScene(scene, willConnectTo: session, options: connectionOptions, locale: localeString, deviceUniqueId: deviceUniqueId)
//        
//        ExperimentationFacade.shared.initialize({
//            ExperimentationFacade.shared.refreshExperiments()
//        })
    }
    
//    func sceneDidBecomeActive(_ scene: UIScene) {
//        AnalyticsFacade.shared.handleSceneDidBecomeActive(scene)
//    }
//
//    func sceneWillResignActive(_ scene: UIScene) {
//        AnalyticsFacade.shared.handleSceneWillResignActive(scene)
//    }
//
//    func sceneWillEnterForeground(_ scene: UIScene) {
//        AnalyticsFacade.shared.handleSceneWillEnterForeground(scene)
//    }
//
//    func sceneDidEnterBackground(_ scene: UIScene) {
//        AnalyticsFacade.shared.handleSceneDidEnterBackground(scene)
//    }
//
//    func sceneDidDisconnect(_ scene: UIScene) {
//        AnalyticsFacade.shared.handleSceneDidDisconnect(scene)
//        ExperimentationFacade.shared.terminate()
//    }
}
