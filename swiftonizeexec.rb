# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Swiftonizeexec < Formula
  desc ""
  homepage ""
  url "https://github.com/PythonSwiftLink/SwiftonizeExec/archive/1.tar.gz"
  version "0"
  sha256 "d4a1966c6adc476c3008b6ecfefe1dcf8009c2108b4ccd243374009a8dce2af0"
  license ""

  # depends_on "cmake" => :build

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    # https://rubydoc.brew.sh/Formula.html#std_configure_args-instance_method
    system "swift", "build", "-c", "release", "--disable-sandbox"
    # system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    bin.install ".build/x86_64-apple-macosx/release/SwiftonizeExecutable" => "Swiftonize"
	bin.install "python_stdlib"
	bin.install "python-extra"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test SwiftonizeExec`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
