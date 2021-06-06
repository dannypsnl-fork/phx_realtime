defmodule PhxRealtimeWeb.AuthSocketTest do
  use PhxRealtimeWeb.ChannelCase
  import ExUnit.CaptureLog
  alias PhxRealtimeWeb.AuthSocket

  describe "connect/3" do
    test "can be connected to with a valid token" do
      assert {:ok, %Phoenix.Socket{}} = connect(AuthSocket, %{"token" => generate_token(1)})
      assert {:ok, %Phoenix.Socket{}} = connect(AuthSocket, %{"token" => generate_token(2)})
    end
  end

  describe "connect/3 error" do
    test "can be connected to without parameters" do
      params = %{"token" => generate_token(1, salt: "invalid")}

      assert capture_log(fn ->
               assert :error = connect(AuthSocket, params)
             end) =~ "[error] #{AuthSocket} connect error :invalid"
    end
  end

  describe "id/1" do
    test "an identifier is based on the connected ID" do
      {:ok, socket} = connect(AuthSocket, %{"token" => generate_token(1)})
      assert AuthSocket.id(socket) == "auth_socket:1"

      {:ok, socket} = connect(AuthSocket, %{"token" => generate_token(2)})
      assert AuthSocket.id(socket) == "auth_socket:2"
    end
  end

  defp generate_token(id, opts \\ []) do
    salt = Keyword.get(opts, :salt, "salt identifier")
    Phoenix.Token.sign(PhxRealtimeWeb.Endpoint, salt, id)
  end
end
