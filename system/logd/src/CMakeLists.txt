cmake_minimum_required(VERSION 2.6)

PROJECT(yunapbx-logd C)
ADD_DEFINITIONS(-Os -ggdb -Wall -Werror --std=gnu99 -Wmissing-declarations)

SET(CMAKE_SHARED_LIBRARY_LINK_C_FLAGS "")

find_library(json NAMES json-c json)

ADD_EXECUTABLE(logd log/logd.c log/syslog.c)
TARGET_LINK_LIBRARIES(logd ubox ubus)
INSTALL(TARGETS logd
        RUNTIME DESTINATION sbin
)

ADD_EXECUTABLE(logread log/logread.c)
TARGET_LINK_LIBRARIES(logread ubox ubus ${json} blobmsg_json)
INSTALL(TARGETS logread
        RUNTIME DESTINATION sbin
)

