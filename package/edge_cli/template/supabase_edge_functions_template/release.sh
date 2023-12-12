# /bin/sh

rm -r -f functions/supabase_edge_functions_template
rm -r -f supabase/functions/supabase_edge_functions_template
dart run edge build supabase_functions
mkdir -p supabase/functions/supabase_edge_functions_template
cp -r -f functions/supabase_edge_functions_template supabase/functions/supabase_edge_functions_template
