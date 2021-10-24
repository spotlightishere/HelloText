//
//  ViewController.swift
//  HelloText
//
//  Created by Spotlight Deveaux on 2021-10-21.
//

import Cocoa
import Dynamic

class ViewController: NSViewController {
    var timer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Load IASUtilities.
        dlopen("/System/Library/PrivateFrameworks/IASUtilities.framework/IASUtilities", RTLD_NOW)
        let view = Dynamic.IASCursiveTextView.initWithFrame(view.frame)

        let cursiveTextView: AnyClass = NSClassFromString("IASCursiveTextView")!
        let languages = Bundle(for: cursiveTextView).urls(forResourcesWithExtension: "json", subdirectory: "Hello Text")!

        self.view.addSubview(view.asAnyObject as! NSView)
        view.loadText(languages[0], pointSize: 72.0)
        view.setCurrentLanguageCode(languages[0].deletingPathExtension().lastPathComponent)

        var startDate = 0.7
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            view.setTime(1 - mach_continuous_time())
        }

//        test.

//        view.setHelloLanguages(languages)
//
//        print(languages)
    }

    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
}
