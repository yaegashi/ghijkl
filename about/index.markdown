---
title: このサイトについて
slug: about
layout: default
---
# {{page.title}}
{: .page-header .text-center}

## 特徴

[Jekyll 2.2.0][1] と [Twitter Bootstrap 3.2.0][2]
による非常に単純なサイト構築の例です
(参照: [ほげめも: Jekyll+BootStrap でサイトリニューアル][blog])。

ソースコードは <https://github.com/yaegashi/ghijkl> にあります。
また [GitHub Pages][3] として
<http://yaegashi.github.io/ghijkl> にデプロイしています。

[jekyll-haml][4] と [jekyll-assets][5] の両プラグインを使用しています。
[HAML][6] [SASS][7] [Markdown][8] による効率的な記述が可能です。

SASS に変換された Bootstrap として [bootstrap-sass][9] を使用しています。
[Bootstrap のカスタマイズ][10] が SASS 変数を用いて自由にできます。

[1]: http://jekyllrb.com/
[2]: http://getbootstrap.com/
[3]: http://pages.github.com/
[4]: https://github.com/samvincent/jekyll-haml
[5]: https://github.com/ixti/jekyll-assets
[6]: http://haml.info/
[7]: http://sass-lang.com/
[8]: https://github.com/bhollis/maruku/blob/master/docs/markdown_syntax.md
[9]: https://github.com/twbs/bootstrap-sass
[10]: http://getbootstrap.com/customize/#less-variables
[blog]:http://blog.keshi.org/hogememo/2013/10/07/site-renewal-with-jekyll-and-bootstrap

## 構築手順

最初に必要なソフトウェアをインストールします。

Ruby 1.9.3 および Bundler が動く環境であれば十分です。
Debian (wheezy 以降) や Ubuntu を使っている場合、
次のパッケージをインストールしてください。

    sudo apt-get install git ca-certificates
    sudo apt-get install build-essential python-pygments
    sudo apt-get install ruby ruby-dev bundler

リポジトリをクローンして Bundler で gem をインストールし、
Rake で必要なアセット ([jQuery](http://jquery.com/) スクリプトや
[Pygments](http://pygments.org/) スタイルシート) を
`_vendors` ディレクトリに配置し、
Jekyll でサイトを構築します。

    git clone https://github.com/yaegashi/ghijkl
    cd ghijkl
    bundle install --path _bundle
    bundle exec rake vendors
    bundle exec jekyll build

これにより `_site` ディレクトリに構築されたサイトが出力されます。

次のコマンドによりテスト用の web サーバが起動できます。

    bundle exec jekyll serve --watch

<http://server:4000/ghijkl/> より構築されたサイトが確認可能です。
またソースコードを変更するとサイトも自動的に再構築されます。

<http://yaegashi.github.io/ghijkl> にデプロイするために
`_config.yml` にて次のように設定していることに注意してください。

    baseurl: /ghijkl
    assets:
      baseurl: /ghijkl/assets/

## デプロイ手順

[GitHub Pages][3] にデプロイするための
Rake タスク `deploy` が定義されています。

デプロイ設定は `_config.yml` の `deploy:` に書きます。

    deploy:
      dir: _deploy
      url: git@github.com:yaegashi/ghijkl
      branch: gh-pages

デプロイ先のリポジトリ
`url` にまだブランチ `branch` がない場合は次のコマンドで作成します。

    bundle exec rake deploy:init

次のコマンドでデプロイを行います。

    bundle exec rake deploy

1. (初回のみ) `dir` に `url` のリポジトリをクローンし `branch` をチェックアウト
2. `dir` にサイトを出力
3. (変更点がある場合のみ) Git コミット・プッシュ

ブランチの不整合などでプッシュが失敗する場合には
`dir` を消してからもう一度試してみてください。
