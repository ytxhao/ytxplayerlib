file(REMOVE_RECURSE
  "libx265.pdb"
  "libx265.so"
  "libx265.so.110"
)

# Per-language clean rules from dependency scanning.
foreach(lang ASM_YASM CXX)
  include(CMakeFiles/x265-shared.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
