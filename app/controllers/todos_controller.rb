class TodosController < ApplicationController
  before_action :set_todo, only: [:destroy]

  def index
    @todos = Todo.all
  end

  def new
  end

  def create
    
  end

  def destroy
    @todo.destroy
    redirect_to todos_path
  end

  private

  def todos_params
    params.require(:todo).permit(:title)
  end

  def set_todo
    @todo = Todo.find(params[:id])
  end
end
