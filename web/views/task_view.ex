defmodule MyApp_802337.TaskView do
  use MyApp_802337.Web, :view

  def render("index.json", %{tasks: tasks}) do
    %{data: render_many(tasks, "task.json")}
  end

  def render("show.json", %{task: task}) do
    %{data: render_one(task, "task.json")}
  end

  def render("task.json", %{task: task}) do
    %{id: task.id}
  end
end
