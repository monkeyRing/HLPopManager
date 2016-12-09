

Pod::Spec.new do |s|
s.name             = "HLPopManager"
s.version          = "0.1.0"
s.summary          = "HLPopManager is a swift module for popViewManager."
s.homepage         = "https://github.com/MonkeyRing/HLPopManager.git"
s.license          = 'MIT'
s.author           = { "monkeyRing" => "502086651@qq.com" }
s.source           = { :git => "https://github.com/MonkeyRing/HLPopManager.git", :tag => "0.1.0" }
s.platform     = :ios, '9.0'
s.requires_arc = true
s.source_files = "HLPopManager/Classes/*.swift", "HLPopManager/Classes/**/*.swift"  #包含的source文件
end
