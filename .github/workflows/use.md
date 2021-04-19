# Github Action 1-N Trigger
__Step 1. 文件区分__  
触发仓库：template  
目标仓库：nRepo  
   
<br>

__Step 2. 个人key配置__  
Settings -> Developer settings -> Personal access tokens -> Generate new token  
<font color=red>*生成token时需要选中 Select scopes 中的 repo 复选框*</font>
  
<br>

__Step 3. template仓库secret配置__  
template仓库 -> settings -> secrets -> New repository secret  
格式：USERNAME:第二步中的key  
示例：Alanspants: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  
<font color=red>*此Secret命名为ACCESS_TOKEN*</font>

<br>

__Step 4. template仓库action配置__  
在template的action中新增step  
```
- name: Run a one-line script
        env:
          FILES: 需要触发的仓库列表
        run: |
          for f in $FILES
          do
            curl -X POST https://api.github.com/repos/组织名/$f/dispatches \
            -H 'Accept: application/vnd.github.everest-preview+json' \
            -u ${{ secrets.ACCESS_TOKEN }} \
            --data '{"event_type": "triggerBy", "client_payload": { "repository": "'"$GITHUB_REPOSITORY"'" }}'
          done
```
示例： 本仓库名为projBBB，需要触发mgithubTestOrg中的 projAAA仓库 和 projCCC仓库
```
name: CI

on:
  push:
    branches:
      - main
      - master
      
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Run a one-line script
        env:
          FILES: projAAA projCCC
        run: |
          for f in $FILES
          do
            curl -X POST https://api.github.com/repos/mgithubTestOrg/$f/dispatches \
            -H 'Accept: application/vnd.github.everest-preview+json' \
            -u ${{ secrets.ACCESS_TOKEN }} \
            --data '{"event_type": "ping", "client_payload": { "repository": "'"$GITHUB_REPOSITORY"'" }}'
          done
```  
<br>

__Step 5. nRepo仓库中的action配置__  
在需要被触发的仓库的 action 中加上 repository_dispatch 
```
on: repository_dispatch
```

