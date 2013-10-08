require 'open-uri'
require 'yaml'

URL_SASS_BOOTSTRAP = "https://github.com/jlong/sass-bootstrap"
URL_JQUERY = "http://code.jquery.com/jquery-1.10.2.js"

DIR_VENDORS = "_vendors"
DIR_SASS_BOOTSTRAP = File.join(DIR_VENDORS, "sass-bootstrap")
DIR_JQUERY = File.join(DIR_VENDORS, "jquery")
DIR_PYGMENTS = File.join(DIR_VENDORS, "pygments")
FILE_JQUERY = File.join(DIR_JQUERY, "jquery.js")
FILE_PYGMENTS = File.join(DIR_PYGMENTS, "pygments.scss")

DEPLOY_DEFAULT = {
  "dir" => "_deploy",
  "url" => "git@github.com:yaegashi/ghijkl",
  "branch" => "gh-pages",
}

def load_deploy_config
  cfg = YAML.load_file("_config.yml")["deploy"] || {}
  cfg = DEPLOY_DEFAULT.merge(cfg)
  Struct.new(*cfg.keys.map(&:to_sym)).new(*cfg.values)
end

desc "Setup vendor assets in _vendor."
task :vendors do
  FileUtils.rm_rf DIR_VENDORS
  FileUtils.mkdir_p DIR_JQUERY
  open(FILE_JQUERY, "w") do |file|
    file.write open(URL_JQUERY).read
  end
  FileUtils.mkdir_p DIR_PYGMENTS
  sh "pygmentize -S default -f html > #{FILE_PYGMENTS}"
  sh "git clone #{URL_SASS_BOOTSTRAP} #{DIR_SASS_BOOTSTRAP}"
end

desc "Generate the site and push to the remote repository."
task :deploy do
  cfg = load_deploy_config
  if File.exists? File.join(cfg.dir, ".git")
    FileUtils.chdir(cfg.dir) do
      sh "git pull"
    end
  else
    FileUtils.rm_rf cfg.dir
    sh "git clone #{cfg.url} #{cfg.dir} -b #{cfg.branch}"
    FileUtils.chdir(cfg.dir) do
      sh "git config push.default simple"
    end
  end
  sh "bundle exec jekyll build -d #{cfg.dir}"
  FileUtils.chdir(cfg.dir) do
    sh 'test -n "$(git status --porcelain)"' do |ok, status|
      if ok
        sh "git add -A"
        sh "git commit -m 'Built by Jekyll.'"
        sh "git push"
      else
        puts "No changes."
      end
    end
  end
end

desc "Initialize a destination branch in the remote repository."
namespace :deploy do
  task :init do
    cfg = load_deploy_config
    FileUtils.rm_rf cfg.dir
    sh "git init #{cfg.dir}"
    FileUtils.chdir(cfg.dir) do
      open("index.html", "w") do |file|
        file.puts "Initial commit."
      end
      sh "git add -A"
      sh "git commit -m 'Initial commit.'"
      sh "git branch -m #{cfg.branch}"
      sh "git remote add origin #{cfg.url}"
      sh "git push -u origin #{cfg.branch}"
      sh "git config push.default simple"
    end
  end
end
