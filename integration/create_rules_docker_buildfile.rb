require 'erb'

base_path = `git rev-parse --show-toplevel`.strip + "/integration"
template = ERB.new(File.read(base_path + "/rules_docker_buildfile.erb"))
packages = ARGV.first
File.write(base_path + "/BUILD.bazel", template.result(binding))
