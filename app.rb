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

post '/git-append' do
  RepositoryHandler.append(params[:url])
  redirect '/'
end
