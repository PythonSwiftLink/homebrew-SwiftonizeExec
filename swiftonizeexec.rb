# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Swiftonizeexec < Formula
  desc ""
  homepage ""

  url "https://github.com/PythonSwiftLink/SwiftonizeExec/archive/master.zip"
  version "master"
  #sha256 "22813a1b19215b8e43e8d25b8b9d5646e6abe0bdeb84e0573cd448e2e487a12c"
  license ""

  # depends_on "cmake" => :build
  
  def processor_count
	  ((`which hwprefs` != '') ? `hwprefs thread_count` : `sysctl -n hw.ncpu`).to_i
  end
  

  def install

	system "swift", "build", "-c", "release", "--disable-sandbox"
	
	if [[ "${UNAME_MACHINE}" == "arm64" ]]
	then
		bin.install ".build/arm64-apple-macosx/release/SwiftonizeExecutable" => "Swiftonize"
	else
	    	bin.install ".build/x86_64-apple-macosx/release/SwiftonizeExecutable" => "Swiftonize"
	fi

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
