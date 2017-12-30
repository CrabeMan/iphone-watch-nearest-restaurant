import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        UINavigationBar.appearance().barTintColor = Color.border.value
        UINavigationBar.appearance().tintColor = Color.theme.value
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor: Color.theme.value]
        //UIApplication.shared.statusBarStyle(.lightContent, animated: true)
        
        let windows = UIWindow(frame: UIScreen.main.bounds)
        windows.rootViewController = TabBarHelper.mainTabBar
        windows.makeKeyAndVisible()
        self.window = windows
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        
    }

    func applicationWillTerminate(_ application: UIApplication) {
        
    }


}

