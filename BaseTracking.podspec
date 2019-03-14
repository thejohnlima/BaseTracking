Pod::Spec.new do |s|
  s.name               = "BaseTracking"
  s.version            = "1.0.0"
  s.summary            = "BaseTracking is the easiest way to setup your analytics in Swift"
  s.requires_arc       = true
  s.homepage           = "https://github.com/limadeveloper/BaseTracking"
  s.license            = "MIT"
  s.author             = { "John Lima" => "john.limadeveloper@gmail.com" }
  s.social_media_url   = "https://twitter.com/johncarloslima"
  s.platform           = :ios, "9.3"
  s.source             = { :git => "https://github.com/limadeveloper/BaseTracking.git", :tag => "#{s.version}" }
  s.source_files       = "Framework/BaseTracking/Source/*.{swift}"
  s.swift_version      = "4.0"
end