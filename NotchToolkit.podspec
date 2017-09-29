Pod::Spec.new do |s|

  s.name         = "NotchToolkit"
  s.version      = "1.2"
  s.summary      = "A light-weight iOS framework for iPhone's X notch."

  s.description  = "A light-weight framework for iOS that allow developers use the iPhone's X notch space in creative ways."

  s.homepage     = "https://github.com/AFathi/NotchToolkit"
  s.screenshots  = "http://whochatme1.ipage.com/preview.gif"
  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author             = { "AFathi" => "me@ahmedbekhit.com" }
  s.social_media_url   = "http://twitter.com/AFathi"

  s.platform     = :ios, "11.0"

  s.source       = { :git => "https://github.com/AFathi/NotchToolkit.git", :tag => "1.2" }

  s.source_files = "NotchToolkit", "NotchToolkit/**/*.{swift}"

end