require 'milkode/cdweb/app'
require 'repository_handler'

MY_VIEWS = File.dirname(__FILE__) + '/views'

class Sinatra::Base
  # custom find_template from  https://github.com/sinatra/sinatra/issues/48
  def find_template(views, name, engine, &block)
    [MY_VIEWS, views].each { |v| super(v, name, engine, &block) }
  end
end

def project_list
  Database.instance.fileList('/')
end

def init_config
  fname = File.join(Dbdir.default_dir, "milkweb.yaml")

  return if File.exist?(fname)

  File.open(fname, "w") do |f|
    f.write <<EOF
---
:home_title : "gitomb"
:home_icon : "https://raw.github.com/tomykaira/gitomb/master/gitomb.png"

:header_title: "gitomb"
:header_icon : "https://raw.github.com/tomykaira/gitomb/master/gitomb.png"

:display_about_milkode: true
EOF
  end
end

init_config # run on startup

post '/git-append' do
  RepositoryHandler.append(params[:url])
  redirect '/'
end

get '/update-all' do
  RepositoryHandler.update_all
  redirect '/'
end
