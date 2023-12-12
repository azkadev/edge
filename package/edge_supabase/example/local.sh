dart run edge_dart build supabase_functions
mkdir -p supabase/functions/example
cp -r -f functions/ supabase/
sudo supabase functions serve --no-verify-jwt