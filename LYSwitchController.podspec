Pod::Spec.new do |s|
s.name         = "LYSwitchController"
s.version      = "0.0.1"
s.summary      = "简单的封装一个可以切换子视图的控制器"
s.description  = <<-DESC
简单的封装一个可以切换子视图的控制器,简单的封装一个可以切换子视图的控制器
DESC
s.homepage     = "https://github.com/LIYANGSHUAI/LYSwitchController"

s.platform     = :ios, "8.0"
s.license      = "MIT"
s.author             = { "李阳帅" => "liyangshuai163@163.com" }

s.source       = { :git => "https://github.com/LIYANGSHUAI/LYSwitchController.git", :tag => s.version }

s.source_files  = "LYSwitchController", "LYSwitchController/*.{h,m}"
end
