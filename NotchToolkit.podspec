Pod::Spec.new do |s|

  s.name         = "NotchToolkit"
  s.version      = "1.3"
  s.summary      = "An iOS framework for iPhone X notch."

  s.description  = "A framework for iOS that allow developers use the iPhone X notch space in creative ways."

  s.homepage     = "https://github.com/AFathi/NotchToolkit"
  s.screenshots  = "http://ahmedbekhit.com/toolbar_preview.gif"
  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author             = { "Ahmed Bekhit" => "me@ahmedbekhit.com" }
  s.social_media_url   = "http://twitter.com/iAFapps"

  s.platform     = :ios, "11.0"

  s.source       = { :git => "https://github.com/AFathi/NotchToolkit.git", :tag => "1.3" }

  s.source_files = "NotchToolkit", "NotchToolkit/**/*.{swift}"

end