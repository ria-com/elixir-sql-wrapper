# Ria.SQL

```elixir
alias Ria.SQL

# ...

SQL.query("SELECT NOW()")
SQL.query("SELECT ? AS ONE", [1])
SQL.query(MyProject.Repo, "SELECT ? AS TWO", [2])
```

## Installation

```elixir
def deps do
  [{:ria_sql, git: "https://github.com/ria-com/elixir-sql-wrapper.git"}]
end
```

## Configuration

```elixir
# config/dev.exs, config/prod.exs, config/test.exs
config :mariaex,
  default_repo: MyProject.Repo
```
