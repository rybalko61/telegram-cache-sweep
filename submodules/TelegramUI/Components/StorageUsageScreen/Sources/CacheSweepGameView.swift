import UIKit

final class CacheSweepGameView: UIView {
    private struct Litter {
        let position: CGPoint
        let kind: Kind
        let view: UIView
    }

    private enum Kind: Int, CaseIterable {
        case dust, paper, document, clips, photo, wrapper, ticket

        var artwork: [CacheSweepArtwork.Shape] {
            switch self {
            case .dust: return CacheSweepArtwork.dust
            case .paper: return CacheSweepArtwork.paper
            case .document: return CacheSweepArtwork.document
            case .clips: return CacheSweepArtwork.clips
            case .photo: return CacheSweepArtwork.photo
            case .wrapper: return CacheSweepArtwork.wrapper
            case .ticket: return CacheSweepArtwork.ticket
            }
        }

        var particleColor: UIColor {
            switch self {
            case .dust: return UIColor(red: 0.59, green: 0.61, blue: 0.52, alpha: 1)
            case .paper, .ticket: return UIColor(red: 0.72, green: 0.66, blue: 0.58, alpha: 1)
            case .document, .photo: return UIColor(red: 0.57, green: 0.64, blue: 0.74, alpha: 1)
            case .wrapper: return UIColor(red: 0.76, green: 0.55, blue: 0.51, alpha: 1)
            case .clips: return UIColor(red: 0.66, green: 0.63, blue: 0.73, alpha: 1)
            }
        }
    }

    private enum Pose {
        case front, back, left, right

        var artwork: [CacheSweepArtwork.Shape] {
            switch self {
            case .front: return CacheSweepArtwork.front
            case .back: return CacheSweepArtwork.back
            case .left, .right: return CacheSweepArtwork.side
            }
        }
    }

    private let artworkView = ArtworkView()
    private var spawnTimer: Timer?
    private var litter: [Litter] = []
    private var pendingLitter = 0
    private var lastSpawnPosition: CGPoint?
    private var kindOffset = Int.random(in: 0 ..< Kind.allCases.count)
    private var position: CGPoint?
    private var pose = Pose.front
    private var angle = CGFloat.pi
    private var travel: CGFloat = 0
    private var previousTip: CGPoint?
    private var dragOffset: CGPoint?
    private var progressTop: CGFloat = 0

    private var field: CGRect {
        let bottom = min(bounds.height, progressTop - 14.0)
        let top = min(bottom, max(86.0, safeAreaInsets.top + 42.0))
        return CGRect(x: 0, y: top, width: bounds.width, height: max(0, bottom - top))
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        artworkView.paint = { [weak self] context in self?.paint(in: context) }
        artworkView.isOpaque = false
        artworkView.isUserInteractionEnabled = false
        addSubview(artworkView)

        let pan = UIPanGestureRecognizer(target: self, action: #selector(drag(_:)))
        pan.delegate = self
        addGestureRecognizer(pan)
    }

    required init?(coder: NSCoder) {
        nil
    }

    deinit {
        spawnTimer?.invalidate()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        artworkView.frame = bounds
    }

    func update(progressTop: CGFloat) {
        self.progressTop = progressTop
        if let position {
            let next = contained(position)
            if next != position {
                self.position = next
                previousTip = bristles(at: next, angle: visibleAngle)
            }
            litter.removeAll { item in
                guard !field.insetBy(dx: 12, dy: 12).contains(item.position) else { return false }
                item.view.removeFromSuperview()
                return true
            }
            artworkView.setNeedsDisplay()
        }
    }

    @discardableResult
    func begin(at origin: CGPoint) -> CGPoint {
        let start = contained(origin)
        position = start
        previousTip = bristles(at: start, angle: visibleAngle)
        pendingLitter = 8
        spawn()
        spawnTimer = Timer(timeInterval: 0.24, repeats: true) { [weak self] _ in
            guard let self else { return }
            if self.pendingLitter == 0, self.litter.count <= 3 {
                self.pendingLitter = Int.random(in: 5 ... 7)
            }
            guard self.pendingLitter > 0 else { return }
            self.pendingLitter -= 1
            self.spawn()
        }
        if let spawnTimer { RunLoop.main.add(spawnTimer, forMode: .common) }
        artworkView.setNeedsDisplay()
        return start
    }

    func stop() {
        spawnTimer?.invalidate()
        spawnTimer = nil
        isUserInteractionEnabled = false
    }

    private var visibleAngle: CGFloat {
        angle + (UIAccessibility.isReduceMotionEnabled ? 0 : sin(travel * 0.16) * 0.22)
    }

    private func contained(_ point: CGPoint) -> CGPoint {
        let dx = min(51.0, field.width / 2)
        let dy = min(51.0, field.height / 2)
        return CGPoint(x: min(max(point.x, field.minX + dx), field.maxX - dx), y: min(max(point.y, field.minY + dy), field.maxY - dy))
    }

    private func spawn() {
        guard let position, litter.count < 12, field.width > 40, field.height > 40 else { return }
        for _ in 0 ..< 22 {
            let point = CGPoint(x: .random(in: field.minX + 18 ... field.maxX - 18), y: .random(in: field.minY + 19 ... field.maxY - 19))
            guard hypot(point.x - position.x, point.y - position.y) >= 62,
                  litter.allSatisfy({ hypot(point.x - $0.position.x, point.y - $0.position.y) >= 31 }) else { continue }
            if let lastSpawnPosition, hypot(point.x - lastSpawnPosition.x, point.y - lastSpawnPosition.y) < 75 { continue }
            let kind = Kind.allCases[kindOffset % Kind.allCases.count]
            kindOffset += 1
            let itemView = ArtworkView(frame: CGRect(x: point.x - 20, y: point.y - 20, width: 40, height: 40))
            itemView.isOpaque = false
            itemView.isUserInteractionEnabled = false
            itemView.paint = { context in
                context.scaleBy(x: 1.22, y: 1.22)
                CacheSweepArtwork.draw(kind.artwork, in: context)
            }
            let rotation = CGAffineTransform(rotationAngle: .random(in: -0.3 ... 0.3))
            itemView.transform = rotation
            insertSubview(itemView, belowSubview: artworkView)
            litter.append(Litter(position: point, kind: kind, view: itemView))
            lastSpawnPosition = point
            if !UIAccessibility.isReduceMotionEnabled {
                itemView.alpha = 0
                itemView.transform = rotation.scaledBy(x: 0.72, y: 0.72)
                UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseOut) {
                    itemView.alpha = 1
                    itemView.transform = rotation
                }
            }
            return
        }
    }

    @objc private func drag(_ gesture: UIPanGestureRecognizer) {
        guard let position else { return }
        let point = gesture.location(in: self)
        switch gesture.state {
        case .began:
            let translation = gesture.translation(in: self)
            dragOffset = CGPoint(x: point.x - translation.x - position.x, y: point.y - translation.y - position.y)
            fallthrough
        case .changed, .ended:
            if let dragOffset {
                move(to: contained(CGPoint(x: point.x - dragOffset.x, y: point.y - dragOffset.y)))
            }
            if gesture.state == .ended { dragOffset = nil }
        default:
            dragOffset = nil
        }
    }

    private func move(to target: CGPoint) {
        guard let origin = position else { return }
        let dx = target.x - origin.x
        let dy = target.y - origin.y
        let distance = hypot(dx, dy)
        guard distance >= 0.5 else { return }

        let direction = atan2(dx, -dy)
        let turn = atan2(sin(direction - angle), cos(direction - angle))
        let steps = max(1, Int(ceil(distance / 10)), Int(ceil(abs(turn) / 0.28)))
        let startAngle = angle
        let startTravel = travel
        for step in 1 ... steps {
            let fraction = CGFloat(step) / CGFloat(steps)
            let next = CGPoint(x: origin.x + dx * fraction, y: origin.y + dy * fraction)
            angle = startAngle + turn * fraction
            travel = startTravel + distance * fraction
            let tip = bristles(at: next, angle: visibleAngle)
            if let previousTip { sweep(from: previousTip, to: tip) }
            previousTip = tip
        }
        position = target
        let horizontal = sin(direction)
        let vertical = cos(direction)
        if abs(horizontal) > 0.82 {
            pose = horizontal < 0 ? .left : .right
        } else if abs(vertical) > 0.82 {
            pose = vertical > 0 ? .back : .front
        }
        artworkView.setNeedsDisplay()
    }

    private func bristles(at point: CGPoint, angle: CGFloat) -> CGPoint {
        CGPoint(x: point.x + 47 * sin(angle), y: point.y - 47 * cos(angle))
    }

    private func sweep(from: CGPoint, to: CGPoint) {
        let dx = to.x - from.x
        let dy = to.y - from.y
        let squaredDistance = dx * dx + dy * dy
        var collected: [Litter] = []
        litter.removeAll { item in
            let x = item.position.x - from.x
            let y = item.position.y - from.y
            let t = squaredDistance > 0 ? min(1, max(0, (x * dx + y * dy) / squaredDistance)) : 0
            guard hypot(x - t * dx, y - t * dy) <= 19 else { return false }
            item.view.removeFromSuperview()
            collected.append(item)
            return true
        }
        for item in collected where !UIAccessibility.isReduceMotionEnabled {
            scatter(item, direction: CGPoint(x: dx, y: dy))
        }
    }

    private func scatter(_ item: Litter, direction: CGPoint) {
        let distance = max(1, hypot(direction.x, direction.y))
        for index in 0 ..< 11 {
            let size = CGFloat(4 + index % 4)
            let particle = UIView(frame: CGRect(x: item.position.x - size / 2, y: item.position.y - size / 2, width: size, height: size))
            particle.backgroundColor = item.kind.particleColor
            particle.layer.cornerRadius = size / 2
            particle.isUserInteractionEnabled = false
            addSubview(particle)
            let angle = CGFloat(index) * 2.4
            let radius = CGFloat(16 + index * 4)
            let x = direction.x / distance * 16 + cos(angle) * radius
            let y = direction.y / distance * 16 + sin(angle) * radius
            UIView.animate(withDuration: 0.48, delay: 0, options: .curveEaseOut, animations: {
                particle.transform = CGAffineTransform(translationX: x, y: y).scaledBy(x: 0.5, y: 0.5)
                particle.alpha = 0
            }, completion: { _ in particle.removeFromSuperview() })
        }
    }

    private func paint(in context: CGContext) {
        guard let position else { return }
        context.saveGState()
        context.translateBy(x: position.x, y: position.y)
        context.setFillColor(UIColor.black.withAlphaComponent(0.09).cgColor)
        context.fillEllipse(in: CGRect(x: -30, y: 25, width: 60, height: 12))
        if pose == .back {
            context.saveGState()
            context.rotate(by: visibleAngle)
            CacheSweepArtwork.draw(CacheSweepArtwork.broom, in: context)
            context.restoreGState()
        }
        context.saveGState()
        if pose == .left { context.scaleBy(x: -1, y: 1) }
        CacheSweepArtwork.draw(pose.artwork, in: context)
        context.restoreGState()
        if pose != .back {
            context.rotate(by: visibleAngle)
            CacheSweepArtwork.draw(CacheSweepArtwork.broom, in: context)
        }
        context.restoreGState()
    }

    private final class ArtworkView: UIView {
        var paint: ((CGContext) -> Void)?

        override func draw(_ rect: CGRect) {
            if let context = UIGraphicsGetCurrentContext() { paint?(context) }
        }
    }
}

extension CacheSweepGameView: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        guard let position else { return false }
        let point = touch.location(in: self)
        return hypot(point.x - position.x, point.y - position.y) < 52
    }
}
