class NeovimDotApp < Formula
  homepage "https://github.com/rogual/neovim-dot-app"
  head "https://github.com/rogual/neovim-dot-app.git"

  depends_on "neovim" => :build
  depends_on "scons" => :build
  depends_on "msgpack" => :build
  depends_on :python => :recommended if MacOS.version <= :snow_leopard

  def install
    ENV.deparallelize

    system "make"
    system "make", "install"
  end

  def caveats; <<-EOS.undent
      If you want support for Python plugins such as YouCompleteMe, you need
      to install a Python module in addition to Neovim itself.

      See :h nvim-python-quickstart for more information.

      If you still experience some problems with python you can try to define
      let g:python_host_prog='/path/to/python' expliciatly in your ~/.nvimrc file
    EOS
  end
end
