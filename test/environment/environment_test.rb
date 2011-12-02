require 'mccloud'
require 'tempfile'
require 'test/unit'

class TestEnvironment < Test::Unit::TestCase

  # Without a cwd passed, and no mccloudfile in any parentdir
  # The default would be currentdir "."
  def test_environment_default_without_mccloudfile_currentdir
    tempdir = Dir.mktmpdir
    Dir.chdir(tempdir)
    begin
      env=Mccloud::Environment.new()
      assert_equal(Pathname(env.root_path).dirname.realpath,Pathname(tempdir).dirname.realpath)
    ensure 
      FileUtils.remove_entry_secure tempdir
    end
  end

  # Without a cwd passed, and no mccloudfile in any parentdir
  # The default would be currentdir "."
  def test_environment_default_with_mccloudfile_currentdir
    tempdir = Dir.mktmpdir
    Dir.chdir(tempdir)
    FileUtils.touch("Mccloudfile")
    begin
      env=Mccloud::Environment.new()
      assert_equal(Pathname(env.root_path).dirname.realpath,Pathname(tempdir).dirname.realpath)
    ensure 
      FileUtils.remove_entry_secure tempdir
    end
  end

end
