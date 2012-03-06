require 'bundler'
Bundler.setup

desc "Initialize gitomb"
task :init do
  require 'milkode/cdstk/cdstk'
  require 'milkode/common/dbdir'

  dir = Dbdir.default_dir
  FileUtils.mkdir_p dir
  Milkode::Cdstk.new(STDOUT, dir).init
end
