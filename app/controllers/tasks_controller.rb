class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
  end

  def create
    task_title = params['task']['title']
    task_details = params['task']['details']
    @task = Task.new(title: task_title, details: task_details)
    @task.save
  end

  def edit
    @task = Task.find(params['id'])
  end

  def update
    task = Task.find(params['id'])
    task.title = params['task']['title']
    task.details = params['task']['details']
    task.completed = true if params['task']['completed'] == 'on'
    task.completed = false if params['task']['completed'] == 'off'
    task.save
  end

  def destroy
    task = Task.find(params['id'])
    task.destroy
  end
end
