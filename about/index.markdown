---
title: このサイトについて
slug: about
layout: default
---
# {{page.title}} {: .page-header .text-center}

## 特徴

[Jekyll][1] と [Twitter Bootstrap 3.0][2] による非常に単純なサイト構築の例です。

ソースコードは <https://github.com/yaegashi/ghijkl> にあります。
また [GitHub Pages][3] として
<http://yaegashi.github.io/ghijkl> にデプロイしています。

[jekyll-haml][4] と [jekyll-assets][5] の両プラグインを使用しています。
[HAML][6] [SASS][7] [Markdown][8] による効率的な記述が可能です。

SASS に変換された Bootstrap として [sass-bootstrap][9] を使用しています。
[Bootstrap のカスタマイズ][10] が SASS 変数を用いて自由にできます。

[1]: http://jekyllrb.com/
[2]: http://getbootstrap.com/
[3]: http://pages.github.com/
[4]: https://github.com/samvincent/jekyll-haml
[5]: https://github.com/ixti/jekyll-assets
[6]: http://haml.info/
[7]: http://sass-lang/
[8]: https://github.com/bhollis/maruku/blob/master/docs/markdown_syntax.md
[9]: https://github.com/jlong/sass-bootstrap
[10]: http://getbootstrap.com/customize/

## 構築手順

最初に必要なソフトウェアをインストールします。

Debian wheezy を使っている場合、次のパッケージをインストールしてください。

    apt-get install ruby bundler python-pygments

リポジトリをクローンして
Bundler で gem をインストールし、
Rake で必要なアセット (jQuery, Bootstrap, etc.) を取り込み、
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
