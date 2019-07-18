import UIKit
import AVKit
import AVFoundation

class VideoPlayer: UIViewController {
    

    private func playVideo() {
        guard let path = Bundle.main.path(forResource: "video", ofType:"m4v") else {
            debugPrint("video.m4v not found")
            return
        }
        let player = AVPlayer(url: URL(fileURLWithPath: path))
        let playerController = AVPlayerViewController()
        playerController.player = player
        present(playerController, animated: true) {
            player.play()
        }
    }
}
