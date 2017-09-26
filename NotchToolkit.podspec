Pod::Spec.new do |s|

  s.name         = "NotchToolkit"
  s.version      = "1.0"
  s.summary      = "A light-weight iOS framework for iPhone's X notch."

  s.description  = "A light-weight framework for iOS that allow developers use the iPhone's X notch space in creative ways."

  s.homepage     = "http://github.com/AFathi"
  s.screenshots  = "https://im3.ezgif.com/tmp/ezgif-3-bd73dd3458.gif"
  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author             = { "AFathi" => "me@ahmedbekhit.com" }
  s.social_media_url   = "http://twitter.com/AFathi"

  s.platform     = :ios, "11.0"

  s.source       = { :git => "https://github.com/AFathi/NotchToolkit.git", :tag => "1.0" }

  s.source_files = "NotchToolkit", "NotchToolkit/**/*.{h,m,swift}"

end