defmodule PhxRealtimeWeb.AuthSocket do
  use Phoenix.Socket
  require Logger

  channel "ping", PhxRealtimeWeb.PingChannel
  channel "recurring", PhxRealtimeWeb.RecurringChannel

  def connect(%{"token" => token}, socket, _connect_info) do
    case(verify(socket, token)) do
      {:ok, user_id} ->
        socket = assign(socket, :user_id, user_id)
        {:ok, socket}

      {:error, err} ->
        Logger.error("#{__MODULE__} connect error #{inspect(err)}")
        :error
    end
  end

  def connect(_params, _socket, _connect_info) do
    Logger.error("#{__MODULE__} connect error missing params")
    :error
  end

  def id(%{assigns: %{user_id: user_id}}) do
    "auth_socket:#{user_id}"
  end

  defp verify(socket, token) do
    Phoenix.Token.verify(
      socket,
      "salt identifier",
      token,
      max_age: 86400
    )
  end
end
