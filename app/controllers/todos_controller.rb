class TodosController < ApplicationController
  before_action :set_todo, only: [:destroy]

  def index
    @todos = Todo.all
    @todo = Todo.new
  end

  def new
  end

  def create
    @todo = Todo.new(todos_params)
    if @todo.save
      flash[:notice] = "Post was saved."
      redirect_to todos_path
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :index
    end
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
