//
//  EmotionAnimationView.swift
//  BerARTi
//
//  Created by cleanmac-ada on 27/11/22.
//

import SwiftUI
import Lottie

final class EmotionAnimationView: UIView {
    private var containerStackView: UIStackView
    private var animationView: LottieAnimationView
    private var intensityStackView: UIStackView
    private var minimumValueLabel: UILabel
    private var maximumValueLabel: UILabel
    private var intensitySlider: UISlider
    
    private var animation: LottieAnimation
    private let fileName: String
    private var progress: CGFloat
    private var onProgressUpdated: ((CGFloat) -> Void)?

    init(fileName: String, initialProgress: CGFloat) {
        self.fileName = fileName
        self.progress = initialProgress
        
        containerStackView = UIStackView()
        animationView = LottieAnimationView()
        animation = LottieAnimation.named(fileName)!
        intensityStackView = UIStackView()
        minimumValueLabel = UILabel()
        maximumValueLabel = UILabel()
        intensitySlider = UISlider()
        
        super.init(frame: .zero)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        self.fileName = "animation_emotion_normal.json"
        self.progress = 0
        
        containerStackView = UIStackView()
        animationView = LottieAnimationView()
        animation = LottieAnimation.named(fileName)!
        intensityStackView = UIStackView()
        minimumValueLabel = UILabel()
        maximumValueLabel = UILabel()
        intensitySlider = UISlider()
        
        super.init(coder: coder)
    }
    
    /// Setting up the views
    private func setupUI() {
        containerStackView.translatesAutoresizingMaskIntoConstraints = false
        containerStackView.axis = .vertical
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFill
        animationView.currentProgress = 0
        
        intensityStackView.translatesAutoresizingMaskIntoConstraints = false
        intensityStackView.axis = .horizontal
        intensityStackView.spacing = 16
        intensityStackView.alignment = .center
        
        minimumValueLabel.translatesAutoresizingMaskIntoConstraints = false
        minimumValueLabel.text = "1"
        minimumValueLabel.font = .systemFont(ofSize: 18)
        minimumValueLabel.textColor = UIColor(Color.TEXT_PRIMARY_GREEN)
        
        maximumValueLabel.translatesAutoresizingMaskIntoConstraints = false
        maximumValueLabel.text = "10"
        maximumValueLabel.font = .systemFont(ofSize: 18)
        maximumValueLabel.textColor = UIColor(Color.TEXT_PRIMARY_GREEN)
        
        intensitySlider.translatesAutoresizingMaskIntoConstraints = false
        intensitySlider.minimumValue = 0
        intensitySlider.maximumValue = 1
        intensitySlider.tintColor = UIColor(Color.TEXT_PRIMARY_GREEN)
        intensitySlider.addTarget(self, action: #selector(updateSliderValue(_:)), for: .valueChanged)
        
        intensityStackView.addArrangedSubviews(minimumValueLabel, intensitySlider, maximumValueLabel)
        containerStackView.addArrangedSubviews(animationView, intensityStackView)
        
        addSubview(containerStackView)
        
        NSLayoutConstraint.activate([
            containerStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerStackView.topAnchor.constraint(equalTo: topAnchor),
            containerStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            intensitySlider.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    /// Updates the emotion progress based on the `UISlider`'s value
    /// - Parameter sender: The `UISlider` used for updating the emotion's progress
    @objc private func updateSliderValue(_ sender: UISlider) {
        progress = CGFloat(sender.value)
        animationView.currentProgress = AnimationProgressTime(sender.value)
        onProgressUpdated?(progress)
    }
    
    /// Set the handler to read updated progress values
    /// - Parameter handler: The block to handle the updated progress value
    func setOnProgressUpdateHanlder(_ handler: @escaping (CGFloat) -> Void) {
        self.onProgressUpdated = handler
    }

}
