#
# Be sure to run `pod spec lint MFCalendar.podspec' to ensure this is a
# valid spec.
#
# Remove all comments before submitting the spec. Optional attributes are commented.
#
# For details see: https://github.com/CocoaPods/CocoaPods/wiki/The-podspec-format
#
Pod::Spec.new do |s|
  s.name         = "MFCalendar"
  s.version      = "0.0.1"
  s.homepage     = "https://github.com/swampie/MFCalendar" 
  s.summary 	 = "A calendar component with highlight behaviour."
  s.license      = {:type => "WTFPL", :file => "LICENSE"}
  s.author       = { "swampie" => "matteo.fiandesio@gmail.com" }
  s.source       = { :git => "https://github.com/swampie/MFCalendar.git", :tag => "0.0.1" }
   s.platform     = :ios, '5.0'
   s.source_files = 'MFCalendar/Classes', 'MFCalendar/Classes/**/*.{h,m}'

   s.requires_arc = true

end
