# 🚀 简化发布流程

## 方法 1: 使用一键发布脚本（最简单）

### 完整流程（创建+发布）

```bash
./publish.sh "我的文章标题"
```

**就这么简单！** 脚本会自动：
1. ✅ 创建文章
2. ✅ 设置 draft: false
3. ✅ 提示你编辑内容
4. ✅ 提交到 Git
5. ✅ 推送到 GitHub

### 快速发布（只发布已编辑的文章）

```bash
# 1. 先创建并编辑文章
hugo new posts/my-article.md
# 在 Cursor 中编辑文件，设置 draft: false

# 2. 一键发布
./quick-publish.sh
```

---

## 方法 2: 最简手动流程（3步）

### 步骤 1: 创建文章
```bash
hugo new posts/文章名.md
```

### 步骤 2: 编辑文章
在 Cursor 中打开文件，编辑内容，**设置 `draft: false`**

### 步骤 3: 发布
```bash
git add content/posts/文章名.md && git commit -m "Add post" && git push
```

**完成！** 就这么简单。

---

## 方法 3: 使用 Git 别名（最快）

### 设置别名（只需设置一次）

```bash
git config --global alias.publish '!f() { git add "$1" && git commit -m "Publish: $(basename "$1" .md)" && git push; }; f'
```

### 使用别名发布

```bash
# 创建并编辑文章后
git publish content/posts/文章名.md
```

---

## 对比：原流程 vs 简化流程

### 原流程（6步）
1. `cd /Users/luke/Cursor/NWA-Blog`
2. `hugo new posts/文章名.md`
3. 编辑文件
4. `git add content/posts/文章名.md`
5. `git commit -m "Add post"`
6. `git push`

### 简化流程（1步）
```bash
./publish.sh "文章标题"
```

或（3步）
```bash
hugo new posts/文章名.md
# 编辑文件
git add content/posts/文章名.md && git commit -m "Add post" && git push
```

---

## 推荐工作流程

### 日常写作流程

1. **创建文章**
   ```bash
   hugo new posts/today-article.md
   ```

2. **编辑内容**
   - 在 Cursor 中打开文件
   - 写内容
   - 设置 `draft: false`

3. **一键发布**
   ```bash
   ./quick-publish.sh
   ```

**总时间：约 2 分钟** ⚡

---

## 提示

- 本地预览（可选）：`hugo server -D`
- 查看状态：`git status`
- 撤销更改：`git restore content/posts/文章名.md`

---

## 总结

**最简单的方法：**
```bash
./publish.sh "文章标题"
```

**最快的方法：**
```bash
hugo new posts/name.md && # 编辑文件
./quick-publish.sh
```

就这么简单！🎉

