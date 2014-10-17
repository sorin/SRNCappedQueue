Pod::Spec.new do |s|
  s.name         = "SRNCappedQueue"
  s.version      = "1.1"
  s.summary      = "A capped Objective-C queue"
  s.homepage     = "https://github.com/sorin/SRNCappedQueue"
  s.license      = 'Apache License, Version 2.0'
  s.author       = { "Sorin Neacsu" => "sorin.neacsu@gmail.com" }
  s.platform     = :ios, '6.0'
  s.source       = { :git => "https://github.com/sorin/SRNCappedQueue.git", :tag => "v#{s.version}" }
  s.source_files  = 'SRNCappedQueue/**/*.{m,h}'
  s.requires_arc = true
end
