defmodule MyApp_802337.PageControllerTest do
  use MyApp_802337.ConnCase

  test "GET /" do
    conn = get conn(), "/"
    assert html_response(conn, 200) =~ "Welcome to Phoenix!"
  end
end
