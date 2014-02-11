---
title: RubyGems 更新
layout: post
date: 2014-02-11 17:44:06 +0900
categories: updates
slug: updates
---
## 概要

- 最新の RubyGems に更新しました。
- [Twitter Bootstrap](http://getbootstrap.com) は
[sass-bootstrap](https://github.com/jlong/sass-bootstrap)
の代わりにオフィシャルな
[bootstrap-sass](https://github.com/twbs/bootstrap-sass)
の Gem を使用しています。
- bootstrap-sass のおかげで
[jekyll-assets](https://github.com/ixti/jekyll-assets)
がエラーを出すようになったので
[修正版](https://github.com/yaegashi/jekyll-assets)
を使用しています
([Pull Request](https://github.com/ixti/jekyll-assets/pull/72))。


## Twitter Bootstrap

Twitter Bootstrap のバージョンが 3.1.0 になりました。

bootstrap-sass の Gem を使用したことにより
[Glyphicons](http://getbootstrap.com/components/#glyphicons)
の Web フォントもアセットとして適切にインストールされるようになっています。

<div class="btn-toolbar"> <button type="button" class="btn btn-default btn-lg"><span class="glyphicon glyphicon-home"> </span> Home</button> <button type="button" class="btn btn-default btn-lg"><span class="glyphicon glyphicon-user"> </span> User</button> <button type="button" class="btn btn-default btn-lg"><span class="glyphicon glyphicon-ok-sign" style="color: green"> </span> OK</button> <button type="button" class="btn btn-default btn-lg"><span class="glyphicon glyphicon-remove-sign" style="color: red"> </span> NG</button> </div>
