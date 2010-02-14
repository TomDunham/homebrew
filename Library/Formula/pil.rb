require 'formula'

class Pil <Formula
  url 'http://effbot.org/downloads/Imaging-1.1.7.tar.gz'
  homepage 'http://www.pythonware.com/products/pil/'
  md5 'fc14a54e1ce02a0225be8854bfba478e'

  depends_on 'jpeg' => :recommended
  depends_on 'little-cms' => :optional
  # zlib is in /usr/lib/
  # freetype2 is in /usr/x11/lib
  
  def install
    # barfs with any of  -march=core2 -mmmx -msse4.1
    ENV.minimal_optimization
    system "python", "setup.py", "build_ext", "-I", "#{HOMEBREW_PREFIX}/include:/usr/x11/include", "-L", "#{HOMEBREW_PREFIX}/lib:/usr/x11/lib"
    system "python", "setup.py", "install", "--prefix=#{prefix}"
  end
end
