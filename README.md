# Ria.SQL

```elixir
alias Ria.SQL

# ...

SQL.query("SELECT ? AS ONE", [1])
```

## Installation

```elixir
def deps do
  [{:ria_sql, git: "https://github.com/ria-com/elixir-sql-wrapper.git"}]
end
```