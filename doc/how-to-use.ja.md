# Install
WSL2 + docker + vscode (Remote Development Extensions)をインストールしてください。

## WSL2
https://learn.microsoft.com/ja-jp/windows/wsl/install
```powershell
# defaultはUbuntuが入る
wsl --install

# Ubuntu以外を入れたい人
wsl --list --online
wsl --install -d <Distribution Name>

# windowsを再起動する
```

## Docker
- dockerは、wsl内にdockerを入れる方法と、windowsにdocker desktop for windowsを入れてwsl2と連携する二通りのやり方があります。
- 以下はDocker Desktop for Windowsを入れる方法ですが、今はWSL2にdockerを入れるほうが良いのかもしれません。
### Docker Desktop for Windows
- WSL2を有効化
- Settings > Resources > WSL Integration
  - Enable integration ON 
  - wsl2のdistro内でdockerコマンドが利用可能になる

## VSCode
- windowsにvscodeをインストール
- 以下のExtensionsをインストール
  - Remote Development (ms-vscode-remote.vscode-remote-extensionpack)

# Usage
## open directory in container
1. vscodeを開く
```bash
# in wsl2
cd /path/to/dir
code .
```
2. F1 or `ctrl + shift + p`でvscodeコマンドパレットを開く
3. "Dev Containers: Open Folder in Container"
    - Dockerfileのビルドが走り、vscode - latex workshop extensionがコンテナ内にインストールされる

## TeXファイルのbuild
- workspaceのroot directoryにある.latexmkrcを編集する
- `ctrl + alt + b`、もしくは**LaTeX Workshop - Build with recipe**のRecipe: latexmk (latexmkrc)を選択

## pdfプレビュー
- `ctrl + alt + v`、もしくは**LaTeX Workshop - View LaTeX PDF file**

## TeXファイルの自動format
- **Format Document**
  - ※LaTeX Workshop経由で`latexindent`(perlスクリプト)が呼び出される

## TeXLiveのパッケージ追加インストール
- debianパッケージのtexliveを使っているので、tlmgrの追加パッケージインストールは強制的にusermodeになります
- `~/texmf`以下にインストールされます
```bash
$ tlmgr --usermode install package-name
```
