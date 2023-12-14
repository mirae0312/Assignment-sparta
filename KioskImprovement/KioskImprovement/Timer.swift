//
//  Timer.swift
//  KioskImprovement
//
//  Created by mirae on 12/13/23.
//

import Foundation

class KioskTimer {
    func run(completion: @escaping () -> Void) {
        DispatchQueue.global(qos: .userInitiated).async {
            let timer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true, block: { timer in
                completion()
            })
            RunLoop.current.add(timer, forMode: .default)
            RunLoop.current.run()
        }
    }
}
