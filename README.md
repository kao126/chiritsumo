# サイト名
### CHIRITSUMO（ちりつも）

## サイト概要
### サイトテーマ
日常の些細な社会貢献を投稿できるコミュニティサイト

### テーマを選んだ理由
最近では、インターネットの普及により個人の発信力が高まり、容易に社会全体へ影響を与える事ができるようになった。
そこで、「SDGs」といった世界的な取り組みを日々の投稿を通じて個人単位で発信することで、人々の社会への帰属意識をより高め、
日常生活レベルでの社会貢献を促進することができるのではないかと考え、このテーマにしました。

### ターゲットユーザ
- SDGsに対して積極的に取り組みたい個人/企業

### 主な利用シーン
- (SDGsで掲げられている)17の目標に紐付けて投稿できる
- コミュニティ全体での取り組みをグラフで可視化できる


## 機能一覧
- ゲストログイン
- 会員機能
    - 投稿機能
    - 投稿の公開・非公開(下書き)設定機能
    - 投稿検索機能(キーワード検索)
    - 投稿検索機能(ハッシュタグ検索)
    - いいね(ブックマーク)機能
    - いいね(ブックマーク)一覧表示機能
    - コメント機能
    - 投稿のグラフ化（chartkick）

- 管理者機能
    - ユーザー管理機能
    - 投稿管理機能
    - コメント管理機能


## 設計書
### ER図
![ポートフォリオ制作_ER図](https://user-images.githubusercontent.com/76607249/178893738-c184a8e4-5805-4a79-8aa2-14151b1fbe0e.jpg)

### テーブル定義書
- https://docs.google.com/spreadsheets/d/1YvmasrvPGZiComU3AbfZHyGilstKPggGtmtsbhqb09Q/edit?usp=sharing

### アプリケーション詳細設計書
- https://docs.google.com/spreadsheets/d/1mgF3abJWFw7yCjlhy3bBllkd6EcjsB4FZH5FGBLCeYU/edit?usp=sharing


## 開発環境
- OS：Amazon Linux release 2 (Karoo)
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- JSライブラリ：jQuery
- IDE：Cloud9

## 使用素材
<!--- 外部サービスの画像素材・音声素材を使用した場合は、必ずサービス名とURLを明記してください。-->
<!--- 使用しない場合は、使用素材の項目をREADMEから削除してください。-->
- 国際連合広報センター
  https://www.unic.or.jp/activities/economic_social_development/sustainable_development/2030agenda/sdgs_logo/



## 確認事項
- 「rails db:seed_fu」で初期データの読み込み
- 管理者ログイン情報(URL：".../admins/sign_in", Email：admin@admin.com / Pass：000000)