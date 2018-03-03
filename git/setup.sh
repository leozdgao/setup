#! /bin/bash

# 获取当前脚本所在路径
path_script_self=$(cd "$(dirname "$0")"; pwd)
# git-templates 所在路径
path_git_template="${HOME}/.git-templates"
# git-templates hooks 所在路径
path_git_template_hook="${path_git_template}/hooks"

# 保证目录存在
if [[ ! -d $path_git_template_hook ]]; then
  echo "检测到 git-templates 不存在，自动创建目录 ~/.git-templates/hooks"
  mkdir -p $path_git_template_hook
fi

# 确保 git-templates 的配置
git config --global init.templatedir $path_git_template
# 将 post-checkout 内容拷贝过去
cp "${path_script_self}/post-checkout" $path_git_template_hook
# 默认 git identity
cp "${path_script_self}/git-identity" "${HOME}/.git-identity"
# 加权，保证可执行
chmod +x "$path_git_template_hook/post-checkout"

# say goodbye
echo "git-templates 与 hooks 已配置完毕"
