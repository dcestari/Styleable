Pod::Spec.new do |s|
  s.name             = 'Styleable'
  s.version          = '0.0.1'
  s.summary          = 'Styleable views for Storyboard'
  s.description      = 'Add custom styles to views directly from your Storyboard'
  s.homepage         = 'https://github.com/dcestari/Styleable'
  s.license          = 'MIT'
  s.author           = { 'Daniel Cestari' => 'dcestari@gmail.com' }
  s.social_media_url = 'https://twitter.com/dcestari'
  s.platform         = :ios
  s.source           = { :git => 'https://github.com/dcestari/Styleable.git', :tag => "#{s.version}" }
  s.source_files     = '*.{h,m}'
  s.requires_arc     = true
end