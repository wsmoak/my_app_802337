defmodule MyApp_802337.TaskControllerTest do
  use MyApp_802337.ConnCase

  alias MyApp_802337.Task
  @valid_attrs %{due_at: %{day: 17, hour: 14, min: 0, month: 4, year: 2010}, title: "some content"}
  @invalid_attrs %{}

  setup do
    conn = conn() |> put_req_header("accept", "application/json")
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, task_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    task = Repo.insert! %Task{}
    conn = get conn, task_path(conn, :show, task)
    assert json_response(conn, 200)["data"] == %{
      "id" => task.id
    }
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_raise Ecto.NoResultsError, fn ->
      get conn, task_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, task_path(conn, :create), task: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Task, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, task_path(conn, :create), task: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    task = Repo.insert! %Task{}
    conn = put conn, task_path(conn, :update, task), task: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Task, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    task = Repo.insert! %Task{}
    conn = put conn, task_path(conn, :update, task), task: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    task = Repo.insert! %Task{}
    conn = delete conn, task_path(conn, :delete, task)
    assert response(conn, 204)
    refute Repo.get(Task, task.id)
  end
end
