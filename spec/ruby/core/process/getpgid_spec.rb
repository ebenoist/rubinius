require File.expand_path('../../../spec_helper', __FILE__)

describe "Process.getpgid" do
  platform_is_not :windows do
    it "requires one argument" do
      lambda { Process.getpgid }.should raise_error(ArgumentError)
    end

    it "returns the process group ID for the given process id" do
      Process.getpgid(Process.pid).should == Process.getpgrp
    end

    it "returns the process group ID for the calling process id when passed 0" do
      Process.getpgid(0).should == Process.getpgrp
    end
  end
end
