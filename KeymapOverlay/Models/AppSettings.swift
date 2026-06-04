import Foundation
import ServiceManagement

enum KeyboardLayoutType: String, CaseIterable {
    case corne = "Corne"
    case sofle = "Sofle"

    func keyDefinitions(from bindings: [LayerBinding], heldBindings: [Int: LayerBinding] = [:]) -> [KeyDefinition] {
        switch self {
        case .corne: return CorneLayout.keyDefinitions(from: bindings, heldBindings: heldBindings)
        case .sofle: return SofleLayout.keyDefinitions(from: bindings, heldBindings: heldBindings)
        }
    }

    func mainRows(for half: KeyHalf, keys: [KeyDefinition]) -> [[KeyDefinition]] {
        switch self {
        case .corne: return CorneLayout.mainRows(for: half, keys: keys)
        case .sofle: return SofleLayout.mainRows(for: half, keys: keys)
        }
    }

    func thumbKeys(for half: KeyHalf, keys: [KeyDefinition]) -> [KeyDefinition] {
        switch self {
        case .corne: return CorneLayout.thumbKeys(for: half, keys: keys)
        case .sofle: return SofleLayout.thumbKeys(for: half, keys: keys)
        }
    }

    var defaultKeys: [KeyDefinition] {
        switch self {
        case .corne: return CorneLayout.defaultKeys
        case .sofle: return SofleLayout.defaultKeys
        }
    }
}

@Observable
class AppSettings {
    static let shared = AppSettings()

    var configFilePath: String {
        didSet { UserDefaults.standard.set(configFilePath, forKey: "configFilePath") }
    }

    var showDelaySeconds: Double {
        didSet { UserDefaults.standard.set(showDelaySeconds, forKey: "showDelaySeconds") }
    }

    var overlayScale: Double {
        didSet { UserDefaults.standard.set(overlayScale, forKey: "overlayScale") }
    }

    var keyboardLayout: KeyboardLayoutType {
        didSet { UserDefaults.standard.set(keyboardLayout.rawValue, forKey: "keyboardLayout") }
    }

    var openAtLogin: Bool {
        didSet {
            if openAtLogin {
                try? SMAppService.mainApp.register()
            } else {
                try? SMAppService.mainApp.unregister()
            }
        }
    }

    private init() {
        self.configFilePath = UserDefaults.standard.string(forKey: "configFilePath") ?? ""
        let savedLayout = UserDefaults.standard.string(forKey: "keyboardLayout") ?? ""
        self.keyboardLayout = KeyboardLayoutType(rawValue: savedLayout) ?? .corne
        self.showDelaySeconds = UserDefaults.standard.object(forKey: "showDelaySeconds") != nil
            ? UserDefaults.standard.double(forKey: "showDelaySeconds")
            : 0.6
        self.overlayScale = UserDefaults.standard.object(forKey: "overlayScale") != nil
            ? UserDefaults.standard.double(forKey: "overlayScale")
            : 1.0

        if !UserDefaults.standard.bool(forKey: "hasLaunchedBefore") {
            self.openAtLogin = true
        } else {
            self.openAtLogin = SMAppService.mainApp.status == .enabled
        }
    }
}
