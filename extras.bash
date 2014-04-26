# json formatting helpers
jcurl() {
  curl -s $@ | jsonator
}
jtwurl() {
  twurl $@ | jsonator
}
otwurl() {
  twurl $@ | objenator
}

# formatters
jsonator() {
  ruby -rubygems -r pp -e 'require "json"; ARGF.each {|l| puts JSON.pretty_generate(JSON.parse(l))}'
}
objenator() {
  ruby -rubygems -r pp -e 'require "json"; pp JSON.parse(ARGF.read)'
}