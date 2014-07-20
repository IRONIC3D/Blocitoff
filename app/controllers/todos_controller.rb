class TodosController < ApplicationController
  respond_to :html, :js
  before_action :set_todo, only: [:destroy]
  before_action :create_todo, only: [:create]

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
    @todo = current_user.todos.build( todos_params )
    @todos = Todo.where(user_id: current_user.id)
    @new_todo = Todo.new
    if @todo.save
      flash[:notice] = "Todo was saved."
    else
      puts "******************"
      puts "Inside TODOS#CREATE ERROR"
      flash[:error] = "There was an error saving the post. Please try again."
    end

    respond_with(@todo) do |format|
      format.html { redirect_to todos_path }
    end

  end

  def destroy
    if @todo.destroy
      flash[:notice] = "Todo was deleted"
    else
      puts "******************"
      puts "Inside TODOS#DESTROY ERROR"
      flash[:error] = "Could not remove Todo, there was an error. Please try again"
    end
    
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

  def create_todo
    @todo_item = Todo.new
  end
end
