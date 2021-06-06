defmodule PhxRealtimeWeb.UserSocketTest do
  use PhxRealtimeWeb.ChannelCase
  alias PhxRealtimeWeb.UserSocket

  describe "connect/3" do
    test "can be connected to without parameters" do
      assert {:ok, %Phoenix.Socket{}} = connect(UserSocket, %{})
    end
  end

  describe "id/1" do
    test "an identifier isn't provided" do
      {:ok, socket} = connect(UserSocket, %{})
      assert UserSocket.id(socket) == nil
    end
  end
end
