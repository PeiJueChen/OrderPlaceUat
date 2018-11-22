
Pod::Spec.new do |s|

  s.name = "OrderPlaceUat"
  s.version = "0.0.1"
  s.summary = "Order Place Uat"

  s.description = <<-DESC
    a pod that easily implements the orderplace function
                   DESC

  s.homepage = "https://github.com/PeiJueChen/OrderPlaceUat"
  s.license = { :type => 'MIT', :file => 'LICENSE' }
  s.author = { "风筝" => "13286953452@126.com" }

  s.source = { :git => "https://github.com/PeiJueChen/OrderPlaceUat.git", :tag => "#{s.version}" }

  s.ios.deployment_target = "8.0"
  s.swift_version = '4.0'
  s.static_framework = true

  s.frameworks = 'AVFoundation', 'WebKit', 'UIKit', 'Foundation'

  s.default_subspec = 'Core'

  s.subspec "Core" do |core|
    core.ios.vendored_frameworks = 'Classess/frameworks/orderPlaceSDK/OrderPlaceSDK.framework'
  end

  s.subspec "Alipay" do |ali|
    ali.resources = ['Classess/Assets/AlipaySDK.bundle']
    ali.ios.vendored_frameworks = 'Classess/frameworks/orderPlaceAlipaySDK/AlipaySDK.framework', 'Classess/frameworks/orderPlaceAlipaySDK/OrderPlaceAlipaySDK.framework'
    ali.frameworks = 'SystemConfiguration', 'CoreTelephony', 'QuartzCore', 'CoreText', 'CoreGraphics', 'CFNetwork', 'CoreMotion'
    ali.libraries = 'z', 'c++'
    ali.dependency 'OrderPlaceUat/Core'
  end

  s.subspec "Wechat" do |wechat|
    wechat.ios.vendored_frameworks = 'Classess/frameworks/orderPlaceWechatPaySDK/OrderPlaceWechatPaySDK.framework'
    wechat.ios.vendored_library = 'Classess/frameworks/orderPlaceWechatPaySDK/libWeChatSDK.a'
    wechat.frameworks = 'SystemConfiguration', 'Security', 'CoreTelephony', 'CFNetwork'
    wechat.libraries = 'z', 'c++', 'sqlite3.0'
    wechat.dependency 'OrderPlaceUat/Core'
  end


end
