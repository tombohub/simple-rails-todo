class TodosController < ApplicationController
  def index
    @todos = Todo.all
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      redirect_to todos_path, notice: "Todo was created"
    else
      @todos = Todo.all
      render :index
    end
  end

  private
  def todo_params
    params.require(:todo).permit(:title)
  end
end
