# docker-develop-for-react
[Docker](https://www.docker.com/)で[React](https://ja.react.dev/reference/react)開発環境を構築する。

<br>

# Requirement
以下のlocalhost環境で動作確認済み<br>
- [Fedora](https://fedoraproject.org/ja/)39
- [Windows](https://www.microsoft.com/ja-jp/windows/)10

<br>

# Installation
git cloneコマンドで本Repositoryを任意のディレクトリ配下にcloneする。

<br>

# Settings
[.env](./.env)を設定することで、任意の設定でContainerを実行する事が可能である。

## 実行ユーザー名の設定
[.env](./.env)内の`USER_NAME`にコンテナ起動後の実行ユーザーを設定する。

```
USER_NAME = ${実行ユーザー名}
```

<br>

## コンテナイメージ名の設定
[.env](./.env)内の`IMAGE_NAME`を任意のコンテナイメージ名に変更する。

```
IMAGE_NAME = ${コンテナイメージ名}
```

<br>

> [!WARNING]
> コンテナイメージは以下の命名規則に従うこと。<br>
> `^[a-z0-9][a-z0-9_.-]{1,}$`

<br>

> [!NOTE]
> [DockerHub](https://hub.docker.com/)へコンテナイメージのPUSHを想定する場合は以下の命名規則に従うこと。
> ```
> IMAGE_NAME = ${DockerHubユーザー名}/${コンテナイメージ名}:${タグ名}
> ```

<br>

## コンテナ名の設定(Optional)
[.env](./.env)内の`CONTAINER_NAME`を任意のコンテナ名に変更する。
<br>
コンテナ名が起動中のコンテナと重複しないように留意する。

```
CONTAINER_NAME = ${コンテナ名}
```

<br>

## ボリューム名の設定(Optional)
[.env](./.env)内の`VOLUME_NAME`を任意のボリューム名に変更する。
<br>
ボリューム名が起動中のコンテナと重複しないように留意する。

```
VOLUME_NAME = ${ボリューム名}
```

<br>

## ネットワーク名の設定(Optional)
[.env](./.env)内の`NETWORK_NAME`を任意のネットワーク名に変更する。
<br>
ネットワーク名が起動中のコンテナと重複しないように留意する。

```
NETWORK_NAME = ${ネットワーク名}
```

<br>

## nodejs Major Versionの設定(Optional)
[.env](./.env)内の`NODEJS_MAJOR_VERSION`を任意の[nodejs Major Version](https://nodejs.org/en/about/previous-releases)に設定する。

```
NODEJS_MAJOR_VERSION = ${nodejs Major Version}
```

<br>

# Usage

## コンテナ実行
本Repository直下([docker-compose.yml](./docker-compose.yml)が存在するディレクトリ)で以下のコマンドを実行する。

```bash
docker compose up -d --build
```

<br>

## コンテナ環境へのアクセス
1. VSCodeの拡張機能左メニューから拡張機能`リモートエクスプローラー`を押下する。

<img src='images/RemoteDevelopment_RemoteExplorer.png'>

<br>

2. プルダウンを`開発コンテナー`に変更し、コンテナ一覧から本リポジトリ名にマウスオーバーする。

<img src='images/RemoteDevelopment_DevContainer.png'>

<br>

3. 右側に表示される`新しいウィンドウでアタッチする`を押下する。

<img src='images/RemoteDevelopment_AttachNewWindow.png'>

<br>

# Demo
## Project 作成
Container環境で下記コマンドを実行する。

```bash
$ yarn create react-app testapp
```

> [!NOTE]
> Demoでは`testapp`としているが、Application名は任意の名称で良い。

<br>

## Application 実行
1. 実行<br>
Container環境で下記コマンドを実行する。

```bash
$ cd testapp
$ yarn start

Compiled successfully!

You can now view testapp in the browser.

  Local:            http://localhost:3000
  On Your Network:  http://172.28.0.2:3000

Note that the development build is not optimized.
To create a production build, use yarn build.

webpack compiled successfully
```

2. 動作確認<br>
HostのBrowserで[http://localhost:3000](http://localhost:3000)へアクセスし、動作確認を実施する。

<br>
