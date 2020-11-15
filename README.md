# TeXLive-ja
[![](https://images.microbadger.com/badges/image/range3/texlive-ja.svg)](https://microbadger.com/images/range3/texlive-ja "Get your own image badge on microbadger.com")

> TeXLive + Docker Desktop for Windows + WSL 2 + VSCode - Remote - Containers + LaTex Workshop
>
> Win10 WSL2上のDockerコンテナ内にTeXLive環境を構築して、VSCodeのRemote - Containers拡張機能でアクセス、LaTeX Workshop拡張機能でTex編集&ビルド&プレビュー

## Install
### Windows 10 version 2004 (Windows 10 May 2020 Update)
- https://www.microsoft.com/ja-jp/software-download/windows10
###  WSL2
- https://docs.microsoft.com/ja-jp/windows/wsl/install-win10

1. Win10のWSL2実行に必要なOS機能を有効にする。Windows PowerShellを管理者モードで起動し、以下のコマンドを実行
```
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
wsl --set-default-version 2
```
2. OS再起動
3. Microsoft Storeで好きなLinuxディストリビューションをインストール
4. ディストリビューションを起動して初期設定

#### 確認
```
PS C:\Users\username> wsl -l -v
  NAME                   STATE           VERSION
* Debian                 Running         2
```

### Docker Desktop for Windows
- WSL2を有効化
- Settings > Resources > WSL Integration
  - Enable integration ON 
  - wsl2のdistro内でdockerコマンドが利用可能になる

### VSCode
- Extensions
  - Remote Development (ms-vscode-remote.vscode-remote-extensionpack)

### その他
- ~/.gitconfig
  - ホスト側に設定があれば、Remote Developmentがコンテナ内に転送してくれる
- ssh-agent
  - ホスト側で環境変数SSH_AUTH_SOCKを適切に設定すればRemote Developmentがコンテナに転送してくれる
  - sshkeychainを使うのがおすすめ

## Usage
### templateを開く
- 予めローカルに`git clone`しておいて、`F1` or `ctrl + shift + p`からコマンドパレットを開き、**Remote - Containers: Open Folder in Container**
  - local directoryがdocker containerの`/workspaces/project-name`にbind mountされる

### TeXのbuild
- workspaceのroot directoryにある.latexmkrcを編集する
- `ctrl + alt + b`、もしくは**LaTeX Workshop - Build with recipe**のRecipe: latexmk (latexmkrc)を選択

### pdfプレビュー
- `ctrl + alt + v`、もしくは**LaTeX Workshop - View LaTeX PDF file**

### TeXファイルの自動format
- **Format Document**
  - ※LaTeX Workshop経由で`latexindent`(perlスクリプト)が呼び出される

### TeXLiveのパッケージ追加インストール
```bash
$ sudo tlmgr update --self
$ sudo tlmgr install package-name
$ sudo tlmgr path add
```

### コマンドラインでの利用
```bash
$ docker run -it --rm -v $PWD:/workdir -u texlive range3/texlive-ja:latest /bin/bash
$ cd /workdir
$ latexmk
```

### Dockerfileをカスタマイズする
- .devcontainer/Dockerfile
```docker
FROM range3/texlive-ja:latext
RUN \
  # TeXLive packages
  && tlmgr update --self \
  && tlmgr install \
    multibib \
    natbib \
    pdfcrop \
```
- .devcontainer/devcontainer.json
```json5
{
  // ... 略 ...
  
  // "image": "range3/texlive-ja:latest",
  "dockerFile": "Dockerfile",

  // ... 略 ...
}
```
