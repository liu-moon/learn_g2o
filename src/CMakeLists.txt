# 查找Eigen
find_package(Eigen3 REQUIRED)
include_directories(${EIGEN3_INCLUDE_DIRS})

# spdlog
find_package(spdlog REQUIRED)

# 引入 FindG2O.cmake
include(${PROJECT_SOURCE_DIR}/cmake/FindG2O.cmake)
include_directories(${G2O_INCLUDE_DIRS})

add_executable(curve_fit curve_fit.cpp)
target_link_libraries(curve_fit
        spdlog::spdlog
        ${G2O_CORE_LIBRARY}
        ${G2O_SOLVER_DENSE_LIBRARY}
        ${G2O_STUFF_LIBRARY}
)


add_executable(sba_demo sba_demo.cpp)
target_link_libraries(sba_demo
        spdlog::spdlog
        ${G2O_TYPES_ICP_LIBRARY}
        ${G2O_TYPES_SLAM3D_LIBRARY}
        ${G2O_CORE_LIBRARY}
        ${G2O_STUFF_LIBRARY}
        ${G2O_OPENGL_HELPER_LIBRARY}
)