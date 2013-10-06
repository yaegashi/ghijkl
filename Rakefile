require 'open-uri'

URL_SASS_BOOTSTRAP = "https://github.com/jlong/sass-bootstrap"
URL_JQUERY = "http://code.jquery.com/jquery-1.10.2.js"

DIR_VENDORS = "_vendors"
DIR_SASS_BOOTSTRAP = File.join(DIR_VENDORS, "sass-bootstrap")
DIR_JQUERY = File.join(DIR_VENDORS, "jquery")
DIR_PYGMENTS = File.join(DIR_VENDORS, "pygments")
FILE_JQUERY = File.join(DIR_JQUERY, "jquery.js")
FILE_PYGMENTS = File.join(DIR_PYGMENTS, "pygments.scss")

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
