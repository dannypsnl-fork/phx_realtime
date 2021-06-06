defmodule PhxRealtimeWeb.UserSocketTest do
  use PhxRealtimeWeb.ChannelCase
  alias PhxRealtimeWeb.UserSocket

  describe "connect/3" do
    test "can be connected to without parameters" do
      assert {:ok, %Phoenix.Socket{}} = connect(UserSocket, %{})
    end
  end
end
