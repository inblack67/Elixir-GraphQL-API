### GraphQL API

- Typical GraphQL API with **Elixir** and **Phoenix**
  - Authentication
  - CRUD

### Notes

```sh
mix phx.gen.context Auth User users first_name last_name email password

# gen secret for jwt
mix guardian.gen.secret

mix phx.gen.context Blog Post posts title content:text published:boolean user_id:references:users
```
