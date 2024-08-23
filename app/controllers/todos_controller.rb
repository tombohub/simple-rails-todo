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

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    redirect_to todos_path, notice: "Todo deleted"
  end

  def toggle_status
    @todo = Todo.find(params[:id])
    Rails.logger.warn @todo
    @todo.status = @todo.status == "Done" ? "Not Done" : "Done"
    @todo.save
    Rails.logger.warn @todo
    redirect_to todos_path
  end

  private
  def todo_params
    params.require(:todo).permit(:title)
  end
end
