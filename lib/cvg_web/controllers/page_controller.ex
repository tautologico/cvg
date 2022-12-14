defmodule CvgWeb.PageController do
  use CvgWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
