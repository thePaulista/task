# require 'models/task_manager'

class TaskManagerApp <Sinatra::Base
  # set :root, File.expand_path("..", __dir__)
  # set :method_override, true

  get '/' do
    erb :dashboard
  end

  get '/tasks' do
    @tasks = task_manager.all
    erb :index
  end

  get '/tasks/new' do
    erb :new
  end

  post '/tasks' do
    # "<p>Params: #{params}</p> <p>Task params: #{params[:task]}</p>"
    task_manager.create(params[:task])
    redirect '/tasks'
  end

  get '/tasks/:id' do |id|
    @task = task_manager.find(id.to_i)
    erb :show
  end

  get '/tasks/:id/edit' do |id|
    @task = task_manager.find(id.to_i)
    erb :edit
  end

  put '/tasks/:id' do |id|
    task_manager.update(params[:task], id)
    redirect "/tasks/#{id}"
  end

  delete "/tasks/:id" do |id|
    task_manager.delete(id.to_i)
    redirect '/tasks'
  end

  not_found do
    erb :error
  end

  def task_manager
    if ENV["RACK_ENV"] == "test"
      database = YAML::Store.new('db/task_manager_test')
    else
      database = YAML::Store.new('db/task_manager')
    end
    @task_manager ||= TaskManager.new(database)
  end

end
