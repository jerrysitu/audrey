# Audrey

To start your Phoenix server:

- Install dependencies with `mix deps.get`
- Create and migrate your database with `mix ecto.setup`
- Install Node.js dependencies with `npm install` inside the `assets` directory
- Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

- Official website: https://www.phoenixframework.org/
- Guides: https://hexdocs.pm/phoenix/overview.html
- Docs: https://hexdocs.pm/phoenix
- Forum: https://elixirforum.com/c/phoenix-forum
- Source: https://github.com/phoenixframework/phoenix

## Seed with fake data

start remote console first

```
  Audrey.Seed.MacDonalds.run
```

## TODO

- Restrict Google API key to domain!!!
- On property create, if no address found, advise user
- validate address doesn't already exist. Use google place_id
- on load, ask where they're from. Load properties nearby.
- Add square foot, ammenities, # of bedrooms/wash/etc.
- Auth / Login.

# Gigalixir

### Start remote console

```
gigalixir ps:remote_console
```

### Migrate Database

```
gigalixir ps:migrate
```

### Reset database

```
Ecto.Migrator.run(Audrey.Repo, Application.app_dir(:audrey, "priv/repo/migrations"), :down, [all: true])

Ecto.Migrator.run(Audrey.Repo, Application.app_dir(:audrey, "priv/repo/migrations"), :up, [all: true])
```

### Switch git remotes

```
gigalixir git:remote $APP_NAME

gigalixir git:remote audrey-staging
```

### Deploy

```
git push gigalixir
```
