# 📝 一步一步发布博客指南

## 完整流程（4步）

---

## ✅ 步骤 1: 打开终端

### 在 Cursor 中：

**方法 1: 快捷键**
- 按 `Ctrl + \`` (Control + 反引号键)

**方法 2: 菜单**
- 点击顶部菜单 `Terminal` → `New Terminal`

### 验证：

终端打开后，你应该看到类似这样的提示符：
```
luke@Lukes-MacBook-Pro NWA-Blog %
```

**如果不在 NWA-Blog 目录，运行：**
```bash
cd /Users/luke/Cursor/NWA-Blog
```

---

## ✅ 步骤 2: 创建文章

### 在终端中输入：

```bash
hugo new posts/today-article.md
```

**说明：**
- 将 `today-article` 替换为你想要的英文文件名
- 文件名建议：小写字母，用横线连接
- 例如：`my-first-post.md`、`design-thoughts.md`

### 成功提示：

你会看到：
```
Content "content/posts/today-article.md" created
```

---

## ✅ 步骤 3: 编辑文章内容

### 3.1 打开文件

1. 在 Cursor 左侧文件浏览器中，找到：
   ```
   content/posts/today-article.md
   ```

2. 点击打开文件

### 3.2 查看初始内容

文件打开后，你会看到类似这样的内容：

```markdown
---
title: "Today Article"
date: 2025-11-27T21:30:00-06:00
draft: true
categories: []
tags: []
description: ""
---

```

### 3.3 修改内容（重要！）

**必须修改：**

1. **设置发布状态**
   ```markdown
   draft: false    # 改为 false 才能发布！
   ```

2. **填写文章信息**
   ```markdown
   title: "我的第一篇文章"           # 文章标题
   categories: ["设计", "生活"]      # 分类
   tags: ["博客", "分享"]            # 标签
   description: "这是我的第一篇文章" # 描述
   ```

3. **写文章内容**
   在 `---` 下面添加内容：
   ```markdown
   ---
   ...（上面的配置）...
   ---
   
   # 我的第一篇文章
   
   这里是文章的开头...
   
   ## 二级标题
   
   更多内容...
   ```

### 3.4 保存文件

- 按 `Cmd + S` (Mac) 或 `Ctrl + S` (Windows/Linux)
- 或点击菜单 `File` → `Save`

---

## ✅ 步骤 4: 一键发布

### 在终端中输入：

```bash
./quick-publish.sh
```

### 脚本会自动执行：

1. ✅ 找到你刚编辑的文章
2. ✅ 检查是否是草稿状态
3. ✅ 如果是草稿，询问是否自动改为发布状态
4. ✅ 添加到 Git
5. ✅ 提交更改
6. ✅ 推送到 GitHub

### 交互提示：

如果文章还是 `draft: true`，脚本会问：
```
⚠️  警告: 文章还是草稿状态 (draft: true)
   是否自动设置为发布状态? (y/n)
```

**输入 `y` 然后按 Enter**

### 成功提示：

你会看到：
```
✅ 发布成功！

⏱️  等待 1-2 分钟，然后访问: https://blog.nanwang.art
```

---

## 🎉 完成！

### 下一步：

1. **等待部署**（1-2 分钟）
   - 查看状态：https://github.com/diffw/blog/actions

2. **访问博客**
   - https://blog.nanwang.art
   - 找到你的新文章！

---

## 📋 完整命令序列（复制粘贴）

```bash
# 1. 打开终端（Ctrl + `）

# 2. 创建文章
hugo new posts/my-article.md

# 3. 在 Cursor 中编辑文件
#    - 打开 content/posts/my-article.md
#    - 设置 draft: false
#    - 填写内容
#    - 保存（Cmd + S）

# 4. 一键发布
./quick-publish.sh
```

---

## ❓ 常见问题

### Q: 脚本提示 "没有找到未提交的文章"

**A:** 可能的原因：
1. 文件还没有保存
2. 文件已经被提交过了

**解决：**
- 确保文件已保存（Cmd + S）
- 检查 `git status` 查看文件状态

### Q: 脚本提示 "发布失败"

**A:** 可能的原因：
1. Git 未配置
2. 网络问题
3. 需要先 pull 远程更改

**解决：**
```bash
# 先拉取远程更改
git pull

# 然后再试
./quick-publish.sh
```

### Q: 文章在网站上不显示

**A:** 检查：
1. 确认 `draft: false`（不是 `true`）
2. 等待 1-2 分钟让部署完成
3. 清除浏览器缓存后刷新

---

## 💡 提示

- **本地预览**（可选）：`hugo server -D`
- **查看 Git 状态**：`git status`
- **撤销更改**：`git restore content/posts/文章名.md`

---

## 🎯 总结

**最简单的流程：**
1. `hugo new posts/文章名.md`
2. 编辑文件，设置 `draft: false`
3. `./quick-publish.sh`

**就这么简单！** 🚀


