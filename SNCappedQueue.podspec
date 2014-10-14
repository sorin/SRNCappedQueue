Pod::Spec.new do |s|
  s.name         = "SNCappedQueue"
  s.version      = "1.0"
  s.summary      = "A capped Objective-C queue"
  s.homepage     = "https://github.com/sorin/SNCappedQueue"
  s.license      = 'Apache License, Version 2.0'
  s.author       = { "Sorin Neacsu" => "sorin.neacsu@gmail.com" }
  s.platform     = :ios, '6.0'
  s.source       = { :git => "https://github.com/sorin/SNCappedQueue.git", :tag => "v#{s.version}" }
  s.source_files  = 'SNCappedQueue/**/*.{m,h}'
  s.requires_arc = true
end
