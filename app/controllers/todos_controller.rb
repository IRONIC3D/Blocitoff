class TodosController < ApplicationController
  respond_to :html, :js
  before_action :set_todo, only: [:destroy]

  def index
    if(user_signed_in?)
      @todos = Todo.where(user_id: current_user.id)
      @todo = Todo.new
    else
      redirect_to root_path
    end
  end

  def new
  end

  def create
    @todo = current_user.todos.build(todos_params)
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
    # redirect_to todos_path
    
    
    respond_with(@todo) do |format|
      format.html { redirect_to todos_path }
    end
  end

  private

  def todos_params
    params.require(:todo).permit(:title)
  end

  def set_todo
    @todo = Todo.find(params[:id])
  end
end
