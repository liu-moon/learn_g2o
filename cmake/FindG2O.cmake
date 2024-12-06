# 设置 G2O 安装路径
set(G2O_INSTALL_PATH "/usr/local/g2o_2308")

# 设置包含目录
set(G2O_INCLUDE_DIRS "${G2O_INSTALL_PATH}/include")

# 自动查找 lib 目录下所有 .so 文件
file(GLOB G2O_LIBRARIES "${G2O_INSTALL_PATH}/lib/*.so")

# 遍历每个库文件
foreach(LIBRARY ${G2O_LIBRARIES})
    # 提取库名 (不含路径和扩展名)
    get_filename_component(LIB_NAME ${LIBRARY} NAME_WE)

    # 移除前缀 'libg2o_'，得到简化的库名
    string(REGEX REPLACE "^libg2o_" "" SHORT_NAME ${LIB_NAME})
    string(TOUPPER ${SHORT_NAME} UPPER_NAME) # 转换为大写以保持变量风格一致

    # 动态生成变量名，例如 G2O_CLI_LIBRARY
    set(LIB_VARIABLE_NAME "G2O_${UPPER_NAME}_LIBRARY")

    # 设置变量，值为库的完整路径
    set(${LIB_VARIABLE_NAME} ${LIBRARY})

    # 打印生成的变量名和对应的值
    message(STATUS "${LIB_VARIABLE_NAME}: ${LIBRARY}")
endforeach()

# 打印包含目录
message(STATUS "G2O_INCLUDE_DIRS: ${G2O_INCLUDE_DIRS}")
