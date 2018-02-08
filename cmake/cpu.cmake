if (NOT CMAKE_SYSTEM_PROCESSOR)
    message(WARNING "CMAKE_SYSTEM_PROCESSOR not defined")
endif()


if (CMAKE_SYSTEM_PROCESSOR MATCHES "^(x86_64|AMD64)$")
    add_definitions(/DRAPIDJSON_SSE2)
endif()


if (CMAKE_SYSTEM_PROCESSOR MATCHES "^(aarch64)$")
    set(LITIG_ARM     ON)
    set(LITIG_ARMv8   ON)
    set(WITH_LIBCPUID OFF)

    add_definitions(/DLITIG_ARM)
    add_definitions(/DLITIG_ARMv8)
elseif (CMAKE_SYSTEM_PROCESSOR MATCHES "^(armv7|armv7f|armv7s|armv7k|armv7-a|armv7l)$")
    set(LITIG_ARM     ON)
    set(LITIG_ARMv7   ON)
    set(WITH_LIBCPUID OFF)

    add_definitions(/DLITIG_ARM)
    add_definitions(/DLITIG_ARMv7)
endif()
