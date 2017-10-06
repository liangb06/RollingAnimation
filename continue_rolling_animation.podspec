Pod::Spec.new do |s|
  s.name         = "continuerollinganimation"
  s.version      = "0.0.1"
  s.summary      = "A short description of continue_rolling_animation."


  s.homepage     = "https://github.com/liangb06/RollingAnimation"
  s.license      = "liangbin"
  s.author             = { "liangbin" => "liangb06@163.com" }
  s.source       = { :git => "https://github.com/liangb06/RollingAnimation.git" }
  s.platform     = :ios
  s.source_files = "/*.{h,m}"
  s.resources = "Resources/*.png"
end
