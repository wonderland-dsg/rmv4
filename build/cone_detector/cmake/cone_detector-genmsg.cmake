# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "cone_detector: 1 messages, 0 services")

set(MSG_I_FLAGS "-Icone_detector:/home/scuak/rmv4/src/cone_detector/msg;-Istd_msgs:/opt/ros/jade/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(cone_detector_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/scuak/rmv4/src/cone_detector/msg/positionFromDetectRGB.msg" NAME_WE)
add_custom_target(_cone_detector_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "cone_detector" "/home/scuak/rmv4/src/cone_detector/msg/positionFromDetectRGB.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(cone_detector
  "/home/scuak/rmv4/src/cone_detector/msg/positionFromDetectRGB.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cone_detector
)

### Generating Services

### Generating Module File
_generate_module_cpp(cone_detector
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cone_detector
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(cone_detector_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(cone_detector_generate_messages cone_detector_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/scuak/rmv4/src/cone_detector/msg/positionFromDetectRGB.msg" NAME_WE)
add_dependencies(cone_detector_generate_messages_cpp _cone_detector_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(cone_detector_gencpp)
add_dependencies(cone_detector_gencpp cone_detector_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS cone_detector_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(cone_detector
  "/home/scuak/rmv4/src/cone_detector/msg/positionFromDetectRGB.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/cone_detector
)

### Generating Services

### Generating Module File
_generate_module_eus(cone_detector
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/cone_detector
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(cone_detector_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(cone_detector_generate_messages cone_detector_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/scuak/rmv4/src/cone_detector/msg/positionFromDetectRGB.msg" NAME_WE)
add_dependencies(cone_detector_generate_messages_eus _cone_detector_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(cone_detector_geneus)
add_dependencies(cone_detector_geneus cone_detector_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS cone_detector_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(cone_detector
  "/home/scuak/rmv4/src/cone_detector/msg/positionFromDetectRGB.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cone_detector
)

### Generating Services

### Generating Module File
_generate_module_lisp(cone_detector
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cone_detector
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(cone_detector_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(cone_detector_generate_messages cone_detector_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/scuak/rmv4/src/cone_detector/msg/positionFromDetectRGB.msg" NAME_WE)
add_dependencies(cone_detector_generate_messages_lisp _cone_detector_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(cone_detector_genlisp)
add_dependencies(cone_detector_genlisp cone_detector_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS cone_detector_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(cone_detector
  "/home/scuak/rmv4/src/cone_detector/msg/positionFromDetectRGB.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cone_detector
)

### Generating Services

### Generating Module File
_generate_module_py(cone_detector
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cone_detector
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(cone_detector_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(cone_detector_generate_messages cone_detector_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/scuak/rmv4/src/cone_detector/msg/positionFromDetectRGB.msg" NAME_WE)
add_dependencies(cone_detector_generate_messages_py _cone_detector_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(cone_detector_genpy)
add_dependencies(cone_detector_genpy cone_detector_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS cone_detector_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cone_detector)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cone_detector
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
add_dependencies(cone_detector_generate_messages_cpp std_msgs_generate_messages_cpp)

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/cone_detector)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/cone_detector
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
add_dependencies(cone_detector_generate_messages_eus std_msgs_generate_messages_eus)

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cone_detector)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cone_detector
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
add_dependencies(cone_detector_generate_messages_lisp std_msgs_generate_messages_lisp)

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cone_detector)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cone_detector\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cone_detector
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
add_dependencies(cone_detector_generate_messages_py std_msgs_generate_messages_py)
