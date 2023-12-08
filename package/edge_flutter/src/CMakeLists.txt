cmake_minimum_required(VERSION 3.10)
project(edge_flutter_library VERSION 0.0.0 LANGUAGES C CXX)

add_library(edge_flutter SHARED
  "edge.cpp"
)

set_target_properties(edge_flutter PROPERTIES
  # PUBLIC_HEADER edge_flutter.h
  OUTPUT_NAME "edge"
)

target_compile_definitions(edge_flutter PUBLIC DART_SHARED_LIB)
