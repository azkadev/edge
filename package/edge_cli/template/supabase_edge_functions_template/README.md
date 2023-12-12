# Supabase Edge Functions Example

This template demonstrates how to run a [Supabase Edge Functions](https://supabase.com/docs/guides/functions) application via Dart Edge.

## Getting Started

Install the dependencies:

```bash
dart pub get
```

Start the application via Dart Edge CLU & the [`supabase` CLI](https://supabase.com/docs/guides/cli):

```bash
dart run edge build supabase_functions
supabase functions serve supabase_edge_functions_template --no-verify-jwt
```
 