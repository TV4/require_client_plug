defmodule RequireClientPlugTest do
  use ExUnit.Case, async: true
  use Plug.Test

  describe "with a client set" do
    test "passes the conn through" do
      result =
        conn(:get, "/some/path", %{"client" => "test"})
        |> RequireClient.call(RequireClient.init([]))

      refute result.halted
      assert result.state == :unset
    end
  end

  describe "without a client set" do
    test "responds with a custom error message" do
      result =
        conn(:get, "/some/path", %{})
        |> RequireClient.call(RequireClient.init(error: %{code: 1, msg: "custom error"}))

      assert result.halted
      assert result.state == :sent
      assert result.status == 400
      assert get_resp_header(result, "content-type") == ["application/json; charset=utf-8"]

      assert Poison.decode!(result.resp_body) ==
               %{"error" => %{"code" => 1, "msg" => "custom error"}}
    end

    test "responds with a default error message" do
      result =
        conn(:get, "/some/path", %{})
        |> RequireClient.call(RequireClient.init([]))

      assert result.halted
      assert result.state == :sent
      assert result.status == 400
      assert get_resp_header(result, "content-type") == ["application/json; charset=utf-8"]

      assert Poison.decode!(result.resp_body) == %{"error" => "'client' parameter is missing"}
    end
  end
end
