Pod::Spec.new do |s|
  s.name = "XQDCamera"
  s.version = "0.0.1"
  s.summary = "A short description of XQDCamera."
  s.license = {"type"=>"MIT", "file"=>"LICENSE"}
  s.authors = {"EriceWang"=>"wangerdong@treefinance.com.cn"}
  s.homepage = "https://github.com/acct<blob>=<NULL>/XQDCamera"
  s.description = "TODO: Add long description of the pod here."
  s.frameworks = "UIKit"
  s.source = { :path => '.' }

  s.ios.deployment_target    = '7.0'
  s.ios.vendored_framework   = 'ios/XQDCamera.framework'
end
