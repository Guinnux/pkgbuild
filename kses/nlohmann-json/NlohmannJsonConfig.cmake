# - Config file for the NlohmannJson package
# It defines the following variables
#
#  NLOHMANN_JSON_FOUND - System has NlohmannJson
#  NLOHMANN_JSON_INCLUDE_DIR - include directories for NlohmannJson

find_package(PkgConfig)
pkg_check_modules(PC_NLOHMANN_JSON QUIET nlohmann_json)

find_path(NLOHMANN_JSON_INCLUDE_DIR nlohmann-json/json.hpp
  HINTS ${PC_NLOHMANN_JSON_INCLUDEDIR} ${PC_NLOHMANN_JSON_INCLUDE_DIRS}
)

include(FindPackageHandleStandardArgs)
# handle the QUIETLY and REQUIRED arguments and set BIBUN_FOUND to TRUE
# if all listed variables are TRUE
find_package_handle_standard_args(NlohmannJson DEFAULT_MSG
  NLOHMANN_JSON_INCLUDE_DIR
)

mark_as_advanced(NLOHMANN_JSON_INCLUDE_DIR)

set(NLOHMANN_JSON_INCLUDE_DIRS ${NLOHMANN_JSON_INCLUDE_DIR})
