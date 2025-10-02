# OpenGL GN Boilerplate

一个基于 GN 构建系统的 OpenGL 项目模板，使用 GLFW 和 GLAD 库。

## 功能特性

- 🎨 **OpenGL 渲染**：渲染一个橙色三角形
- 🖥️ **跨平台支持**：Windows 和 Linux
- 🚀 **现代构建系统**：使用 GN (Generate Ninja) 构建
- 📦 **依赖管理**：通过 vcpkg 管理第三方库
- 🎮 **键盘控制**：按 ESC 键退出程序

## 系统要求

### Windows
- Windows 10 或更高版本
- Visual Studio 2019 或更高版本（或 LLVM/Clang）
- vcpkg 包管理器

### Linux
- Ubuntu 18.04 或更高版本
- GCC 7.0 或更高版本
- CMake 3.10 或更高版本

## 依赖库

- **GLFW 3.4**：窗口管理和输入处理
- **GLAD**：OpenGL 函数加载器
- **OpenGL 3.3**：图形渲染 API

## 安装依赖

### Windows

1. 安装 vcpkg：
```bash
git clone https://github.com/Microsoft/vcpkg.git
cd vcpkg
.\bootstrap-vcpkg.bat
```

2. 安装依赖库：
```bash
vcpkg install glfw3:x64-windows-static
vcpkg install glad:x64-windows-static
```

### Linux

```bash
sudo apt update
sudo apt install libglfw3-dev libgl1-mesa-dev
```

## 构建项目

### Windows

1. 生成构建文件：
```bash
gn gen out/x64 --args="target_cpu=\"x64\""
```

2. 编译项目：
```bash
ninja -C out/x64
```

### Linux

1. 生成构建文件：
```bash
gn gen out/debug --args="target_cpu=\"x64\""
```

2. 编译项目：
```bash
ninja -C out/debug
```

## 运行程序

### Windows
```bash
out\x64\main.exe
```

### Linux
```bash
out/debug/main
```

## 项目结构

```
opengl-gn-boilerplate/
├── main.cpp             # 主程序文件
├── BUILD.gn             # GN 构建配置
├── build/               # 构建系统文件
│   ├── BUILDCONFIG.gn
│   └── toolchain/
├── out/                 # 构建输出目录
│   └── x64/
└── README.md            # 项目说明
```

## 代码说明

### 主要组件

- **着色器**：顶点着色器和片段着色器
- **顶点缓冲对象 (VBO)**：存储顶点数据
- **顶点数组对象 (VAO)**：管理顶点属性
- **渲染循环**：主循环处理输入和渲染

### 关键函数

- `initialize()`：初始化 GLFW 和 OpenGL
- `keyCallback()`：处理键盘输入
- `main()`：主程序逻辑

## 自定义配置

### 修改窗口大小
在 `main.cpp` 中修改：
```cpp
const int WIDTH = 800;
const int HEIGHT = 600;
```

### 修改三角形颜色
在片段着色器中修改：
```cpp
"color = vec4(1.0f, 0.5f, 0.2f, 1.0f);\n"  // 橙色
```

### 添加更多顶点
修改 `vertices` 数组：
```cpp
GLfloat vertices[] = {
    -0.5f, -0.5f, 0.0f,  // 左下
     0.5f, -0.5f, 0.0f,  // 右下
     0.0f,  0.5f,  0.0f   // 顶部
};
```

## 故障排除

### 常见问题

1. **链接错误**：确保 vcpkg 库路径正确
2. **OpenGL 版本问题**：检查显卡驱动是否支持 OpenGL 3.3
3. **头文件冲突**：确保 `glad/glad.h` 在 `GLFW/glfw3.h` 之前包含

### 调试模式

要启用调试信息，修改 `BUILD.gn`：
```gn
cflags = [
  "/MDd",  # 调试运行时库
  "/Od",   # 禁用优化
]
```

## 许可证

WTFPL (Do What The F*ck You Want To Public License)

## 贡献

欢迎提交 Issue 和 Pull Request！

## 相关链接

- [GLFW 文档](https://www.glfw.org/docs/)
- [OpenGL 教程](https://learnopengl.com/)
- [GN 构建系统](https://gn.googlesource.com/gn/)
- [vcpkg 包管理器](https://github.com/Microsoft/vcpkg)
