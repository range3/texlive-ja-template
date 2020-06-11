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

Windows PowerShellを管理者として実行

```
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
wsl --set-default-version 2
```
- Microsoft Storeで好きなLinuxディストリビューションをインストール
- 1度ディストリビューションを起動して初期設定

確認
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

## Usage
### templateを開く
主な方法 - 2パターン
- 予めローカルに`git clone`しておいて、`F1` or `ctrl + shift + p`からコマンドパレットを開き、**Remote - Containers: Open Folder in Container**
  - local directoryがdocker containerの`/workspaces/project-name`にbind mountされる
- `F1` or `ctrl + shift + p`からコマンドパレットを開き、直接git repositoryを**Remote - Containers: Open Repository in Container**
  - Dockerのnamed volumeが新たに作成されて、workspaceはその中にcloneされる。その後、containerにvolume mount

### TeXのbuild
- workspaceのroot directoryにある.latexmkrcを編集する
- `ctrl + alt + b`、もしくは**LaTeX Workshop - Build with recipe**のRecipe: latexmk (latexmkrc)を選択

### pdfプレビュー
- `ctrl + alt + v`、もしくは**LaTeX Workshop - View LaTeX PDF file**

### TeXファイルの自動format
- **Format Document**
  - ※LaTeX Workshop経由で`latexindent`(perlスクリプト)が呼び出される

### TeXLiveのパッケージ追加インストール
```
$ sudo tlmgr install package-name
```

### コマンドラインでの利用
```
$ docker run -it --rm -v $PWD:/workdir -u texlive range3/texlive-ja:latest /bin/bash
$ cd /workdir
$ latexmk
```
