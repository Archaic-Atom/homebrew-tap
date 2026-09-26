class Atomx < Formula
  include Language::Python::Virtualenv

  desc "Keyboard-first terminal workspace for Codex sessions"
  homepage "https://github.com/Archaic-Atom/atomx"
  url "https://github.com/Archaic-Atom/atomx/releases/download/v0.2.0/atomx_codex-0.2.0.tar.gz"
  version "0.2.0"
  sha256 "6eb179351bb9ec103742d47c3fcfd90db764de228896b9c600f0eef9f1eb0c06"
  license "MIT"

  depends_on "cmake" => :build
  depends_on "ninja" => :build
  depends_on "pkgconf" => :build

  depends_on "freetype"
  depends_on "jpeg-turbo"
  depends_on "libtiff"
  depends_on "python@3.14"
  depends_on "webp"
  depends_on "zlib"

  resource "linkify-it-py" do
    url "https://files.pythonhosted.org/packages/45/98/7a1a5f31fd5c7ba93e963b168e244b8e3dd705b3d2a718e3c3307583bf57/linkify_it_py-2.2.0.tar.gz"
    sha256 "907acd2d17ac1fbb9ddb62c8957ccbd6158cac602231a15c3b0cd1e215f03cee"
  end

  resource "markdown-it-py" do
    url "https://files.pythonhosted.org/packages/06/ff/7841249c247aa650a76b9ee4bbaeae59370dc8bfd2f6c01f3630c35eb134/markdown_it_py-4.2.0.tar.gz"
    sha256 "04a21681d6fbb623de53f6f364d352309d4094dd4194040a10fd51833e418d49"
  end

  resource "mdit-py-plugins" do
    url "https://files.pythonhosted.org/packages/59/fc/f8d0863f8862f25602c0404d75568e89fb6b4109804645e5cdfb1be5cf56/mdit_py_plugins-0.6.1.tar.gz"
    sha256 "a2bca0f039f39dbd35fb74ae1b5f998608c437463371f0ff7f49a19a17a114d0"
  end

  resource "mdurl" do
    url "https://files.pythonhosted.org/packages/d6/54/cfe61301667036ec958cb99bd3efefba235e65cdeb9c84d24a8293ba1d90/mdurl-0.1.2.tar.gz"
    sha256 "bb413d29f5eea38f31dd4754dd7377d4465116fb207585f97bf925588687c1ba"
  end

  resource "packaging" do
    url "https://files.pythonhosted.org/packages/7d/fa/3944b40b07da9ce895c0e6303a5ab7d53da063554f534556b134a54d6093/packaging-26.3.tar.gz"
    sha256 "94edc256424af38762eb31306eed28beb9f0efc50a8837492c9d6fd6004aed79"
  end

  resource "pillow" do
    url "https://files.pythonhosted.org/packages/1c/3d/bb7fca845737cf9d7dbde16ed1843984665ff2e0a518f5db43e77ec540b9/pillow-12.3.0.tar.gz"
    sha256 "3b8182a766685eaa002637e28b4ec8d6b18819a0c71f579bf0dbaa5830297cce"
  end

  resource "platformdirs" do
    url "https://files.pythonhosted.org/packages/72/72/2075f80b8de9992872715444e7088ec3b6eea2bc0e99521e1d6e562e382d/platformdirs-4.11.14.tar.gz"
    sha256 "0e706ec0a73a4ec023d11496153a4b6607a672f4b5027c23c3aefa9c9288c523"
  end

  resource "pygments" do
    url "https://files.pythonhosted.org/packages/49/2e/ced460408999b33da6b31b0021b0f37d329e202d4169aeb164493778f25b/pygments-2.21.0.tar.gz"
    sha256 "610ca751c9bc2492b38eb9a38a7fbc93edbbb2d7182edaf34e66ae493dee5c8c"
  end

  resource "rich" do
    url "https://files.pythonhosted.org/packages/c0/8f/0722ca900cc807c13a6a0c696dacf35430f72e0ec571c4275d2371fca3e9/rich-15.0.0.tar.gz"
    sha256 "edd07a4824c6b40189fb7ac9bc4c52536e9780fbbfbddf6f1e2502c31b068c36"
  end

  resource "textual" do
    url "https://files.pythonhosted.org/packages/00/21/39a76b01bd5eea82a04baaca7580e105d8c59450df03998345bb2cfb307b/textual-8.2.8.tar.gz"
    sha256 "3f106a9fbc73e39dd266c9712432087de78a6d644084c7c241d6a25c3169115b"
  end

  resource "textual-image" do
    url "https://files.pythonhosted.org/packages/09/19/fb4bca0ed5ff657f15b4d31cd3f415c62bc7c69cbd1ccb87457e025348bc/textual_image-0.14.1.tar.gz"
    sha256 "502542955452ca6d67e4e0701021eed6bebbe2e1ccee8dfcb42e5083c9573eda"
  end

  resource "typing-extensions" do
    url "https://files.pythonhosted.org/packages/f6/cc/6253133b5bb138fc3306cebfbda2c520f545d36b5be2c7255cc528bb45d6/typing_extensions-4.16.0.tar.gz"
    sha256 "dc983d19a509c94dba722ee6abd33940f7c05a89e243c47e907eb4db6f1a43e5"
  end

  resource "websockets" do
    url "https://files.pythonhosted.org/packages/18/72/fba934cb3dff7a85d811820efffcd141ddd52b5a2a01637f64551373ff4d/websockets-17.1.tar.gz"
    sha256 "acfea4c20bf54384883ea33b1240fc1db4f52e190823a4e2b334bc3e8bfca96a"
  end

  def install
    virtualenv_install_with_resources
  end

  def caveats
    <<~EOS
      Install the official Codex CLI separately, then launch AtomX with:
        atomx
      If Codex is not signed in, AtomX will offer its login flow.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/atomx --version")
    system "python3.14", "-m", "pip",
           "--python=#{libexec}/bin/python", "check"
    (testpath/"smoke.py").write <<~PYTHON
      import asyncio
      from arcatom_codex.demo import DemoClient
      from arcatom_codex.ui import AtomXApp

      async def main():
          app = AtomXApp(".", client=DemoClient(), demo=True)
          async with app.run_test(size=(100, 40)) as pilot:
              await pilot.pause(0.5)
              assert app.store.sessions
              await app.open_session("demo-login")
              await pilot.pause(0.3)
              assert app.current == "demo-login"

      asyncio.run(main())
    PYTHON
    system libexec/"bin/python", testpath/"smoke.py"
  end
end
