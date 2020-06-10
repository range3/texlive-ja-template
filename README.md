# TeXLive-ja
> TeXLive + Docker Desktop for Windows + WSL 2 + VSCode - Remote - Containers + LaTex Workshop

Win10 WSL2上のDockerコンテナ内にTeXLive環境を構築して、VSCodeのRemote - Containers拡張機能でアクセス、LaTeX Workshop拡張機能でTex編集&ビルド&プレビュー

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
