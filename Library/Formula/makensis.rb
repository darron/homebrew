require 'formula'

class NsisSupport < Formula
  url 'http://downloads.sourceforge.net/project/nsis/NSIS%202/2.46/nsis-2.46.zip'
  sha1 'adeff823a1f8af3c19783700a6b8d9054cf0f3c2'
end

class Makensis < Formula
  url 'http://downloads.sourceforge.net/project/nsis/NSIS%202/2.46/nsis-2.46-src.tar.bz2'
  homepage 'http://nsis.sourceforge.net/'
  sha1 '2cc9bff130031a0b1d76b01ec0a9136cdf5992ce'

  depends_on 'scons' => :build

  def install
    system "scons makensis"
    bin.install "build/release/makensis/makensis"
    NsisSupport.new.brew { (share+"nsis").install Dir['*'] }
  end
end
