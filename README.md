# Miaoji Wallet App

## 项目结构

```
wallet_app/
├── lib/
│   ├── screens/
│   │   └── privacy_security_screen.dart  # 隐私与安全页面
│   └── main.dart                         # 应用入口
├── pubspec.yaml                          # 项目配置文件
└── README.md                             # 项目说明
```

## 技术栈

- Flutter 3.4.0+
- Dart
- Material Design

## 设计系统

基于 Stitch 设计的 "Quiet Zen" 设计系统：

- **颜色**：使用 Morandi 色调，包括 primary (#52616B) 和 secondary (#556354)
- **字体**：Manrope 字体
- **布局**：使用 Paper-on-Stone 分层技术，避免使用线条分隔内容
- **组件**：简约的按钮、卡片和列表设计

## 功能特性

- 生物识别登录（Face ID 或指纹）
- 首页隐藏余额
- 数字密码锁设置
- 账号注销功能

## 如何运行

1. 确保已安装 Flutter SDK：https://flutter.dev/docs/get-started/install
2. 克隆项目到本地
3. 进入项目目录：`cd wallet_app`
4. 安装依赖：`flutter pub get`
5. 运行应用：`flutter run`

## 构建应用

### Android

```bash
flutter build apk
```

### iOS

```bash
flutter build ios
```

## 测试

运行测试：

```bash
flutter test
```