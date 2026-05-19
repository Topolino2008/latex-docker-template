# LaTeX Docker Template

Docker と VS Code Dev Containers を使って、ローカル環境に TeX Live を直接入れずに LaTeX を編集・ビルドするためのテンプレートです。

このリポジトリには `.devcontainer` 設定が含まれているため、VS Code からコンテナを開くと LaTeX Workshop などの拡張機能と TeX Live 環境が自動で用意されます。

## 動作に必要なもの

- Docker Desktop
- Visual Studio Code
- VS Code 拡張機能: Dev Containers
- 任意: Docker DX または Container Tools などの Docker 管理用拡張機能

## 1. Docker Desktop をインストールする

### Windows の場合

1. Docker Desktop for Windows を公式サイトからダウンロードします。
   - https://docs.docker.com/desktop/setup/install/windows-install/
2. インストーラーを実行します。
3. インストール時に WSL 2 を使用する設定を選びます。
4. インストール後、Docker Desktop を起動します。
5. ターミナルまたは PowerShell で次のコマンドを実行し、Docker が使えることを確認します。

```powershell
docker --version
docker run hello-world
```

`hello-world` コンテナが正常に実行されれば Docker の準備は完了です。

Windows で Docker Desktop を使うには、WSL 2 と仮想化機能が有効になっている必要があります。Docker Desktop が起動しない場合は、BIOS/UEFI の仮想化設定や WSL 2 の状態を確認してください。

### macOS / Linux の場合

Docker Desktop または Docker Engine をインストールし、次のコマンドで動作確認してください。

```bash
docker --version
docker run hello-world
```

## 2. VS Code をインストールする

VS Code をまだ入れていない場合は、公式サイトからインストールします。

- https://code.visualstudio.com/

## 3. VS Code 拡張機能をインストールする

このテンプレートを使うために必要な拡張機能は `Dev Containers` です。VS Code の拡張機能画面で検索してインストールしてください。

- Dev Containers: `ms-vscode-remote.remote-containers`
  - https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers

Docker のコンテナやイメージを VS Code 上で確認したい場合は、次のような Docker 管理用拡張機能も入れておくと便利です。

- Docker DX: `docker.docker`
  - https://marketplace.visualstudio.com/items?itemName=docker.docker
- Container Tools: `ms-azuretools.vscode-containers`
  - https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-containers

コマンドラインから入れる場合は、次のように実行できます。

```powershell
code --install-extension ms-vscode-remote.remote-containers
code --install-extension docker.docker
```

LaTeX Workshop は `.devcontainer/devcontainer.json` で指定されているため、コンテナを開くとコンテナ側に自動でインストールされます。

## 4. このリポジトリを VS Code で開く

1. VS Code を起動します。
2. `File` > `Open Folder...` から、このリポジトリのルートフォルダを開きます。
   - 例: `C:\Users\aoki\latex-docker-template`
3. 画面右下に `Reopen in Container` と表示されたらクリックします。
4. 表示されない場合は、コマンドパレットを開いて次を実行します。

```text
Dev Containers: Reopen in Container
```

初回は Docker イメージのビルドが走ります。`texlive-full` をインストールするため、環境や回線によっては時間がかかります。

## 5. LaTeX ファイルを編集・ビルドする

コンテナが開いたら、VS Code 上では `/workspace/workspace` が作業フォルダになります。

主なサンプルは `workspace` フォルダ内にあります。

- `Report`
- `SIP_原稿_例`
- `卒業研究発表会予稿サンプル`
- `卒業研究論文表紙サンプル`
- `卒論_修論テンプレート`
- `Latex_Template_2025`

各フォルダ内の `.tex` ファイルを開いて編集してください。LaTeX Workshop の設定により、保存時に自動ビルドされます。

生成された PDF は各サンプルフォルダ内の `outDir` に出力されます。

例:

```text
workspace/Report/outDir/report.pdf
workspace/卒論_修論テンプレート/outDir/main.pdf
```

手動でビルドしたい場合は、VS Code のコマンドパレットから次を実行します。

```text
LaTeX Workshop: Build LaTeX project
```

## 6. よく使う操作

### PDF を確認する

`.tex` ファイルを開いた状態で、VS Code の右上にある LaTeX Workshop のプレビューアイコンを押すか、コマンドパレットから次を実行します。

```text
LaTeX Workshop: View LaTeX PDF
```

### 一時ファイルを削除する

LaTeX Workshop の設定で、ビルド後に補助ファイルを自動削除するようになっています。手動で削除したい場合は、コマンドパレットから次を実行します。

```text
LaTeX Workshop: Clean up auxiliary files
```

### コンテナを作り直す

Dockerfile や devcontainer 設定を変更した場合は、コマンドパレットから次を実行します。

```text
Dev Containers: Rebuild Container
```

## トラブルシューティング

### Docker が起動していない

VS Code でコンテナを開けない場合は、先に Docker Desktop が起動しているか確認してください。

```powershell
docker ps
```

エラーになる場合は Docker Desktop を起動してから、もう一度 `Reopen in Container` を実行してください。

### 初回ビルドに時間がかかる

この環境は `texlive-full` をインストールするため、初回ビルドには時間がかかります。2 回目以降は Docker のキャッシュが効くため短くなります。

### 日本語ファイル名や日本語 LaTeX がうまく扱えない

各サンプルフォルダの `.latexmkrc` で `lualatex`、`upbibtex`、`dvipdfmx`、`mendex` などを指定しています。ビルドがうまくいかない場合は、対象のフォルダに `.latexmkrc` があるか、LaTeX Workshop のビルドレシピが `latexmk (latexmkrc)` になっているか確認してください。

## 参考リンク

- Docker Desktop for Windows: https://docs.docker.com/desktop/setup/install/windows-install/
- VS Code Dev Containers: https://code.visualstudio.com/docs/devcontainers/containers
- Dev Containers 拡張機能: https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers
- LaTeX Workshop: https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop
