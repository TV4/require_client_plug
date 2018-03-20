# Require Client Plug

Elixir plug that requires the parameters to include `client`.

## Usage

In your controller or router:

```elixir
plug RequireClient, error: some_json_encodable_error
```

`some_json_encodable_error` will be encoded to JSON and returned as part of the response in case of a missing client parameter.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `require_client_plug` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:require_client_plug, "~> 1.0.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/require_client_plug](https://hexdocs.pm/require_client_plug).
