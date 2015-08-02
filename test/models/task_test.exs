defmodule MyApp_802337.TaskTest do
  use MyApp_802337.ModelCase

  alias MyApp_802337.Task

  @valid_attrs %{due_at: %{day: 17, hour: 14, min: 0, month: 4, year: 2010}, title: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Task.changeset(%Task{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Task.changeset(%Task{}, @invalid_attrs)
    refute changeset.valid?
  end
end
