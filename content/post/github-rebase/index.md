---
title: "発展的なGitコマンド特集"
description: "過去のコミットを改竄したり、author date と committer date を同期したり..."
date: 2021-06-08T13:00:00+09:00
slug: github-rebase
image: cover.jpg
categories:
    - GitHub
tags:
    - 覚え書き
---

## 1. committer date を author date に設定する方法

コミットにはコミットの著者である `author` と、コミットを取り込んだ人を表す `committer` の2つの属性が存在していて、
それぞれ別のタイムスタンプ(`author date` と `committer date`)を持っています。

**`author date` と `committer date`を表示するには、以下のコマンドを入力します。**

```shell
$ git log --pretty=fuller
```

**`author date` の日付を `committer date` に設定する場合は、以下のコマンドを実行します。**

```shell
$ git rebase --root --committer-date-is-author-date <branch>
```

**`committer date` の日付を `author date` に設定する場合は、以下のコマンドを実行します。**

```shell
$ git rebase --root --ignore-date <branch>
```

## 2. 過去のコミットメッセージを変更する

```shell
$ git rebase -i --root
```

を入力することで、すべてのコミットがvim上で表示されるので、修正したいコミット先頭の「pick」を「edit」に書き換えます。


## 3. 修正コミットを作成する

まずは、修正を加えたいコミットのハッシュを調べましょう

```shell
$ git log --oneline
```

そのハッシュに fixup でコミットをすることで、追加の修正を加えられます。

```shell
$ git commit --fixup <commit hash>
```

さらに rebase で、fixup コミットを修正したいコミットと合体させます。

```shell
$ git rebase -i --autosquash --root
```
