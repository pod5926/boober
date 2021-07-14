# [BOOBER](https://boober-iyefvtwh-27069184.herokuapp.com/)

![boober](https://user-images.githubusercontent.com/59504568/125578889-e28ac472-b4a8-445a-8185-11a34333d35d.jpg)

# BOOBER とは

  <p>読んだ本の画像、感想を投稿し記録する Ruby on Rails で作成した アプリです。<br>
  ユーザーが今まで読んだ本を一覧で確認することができ、思い出を記録することができます。</p>
  <p><strong> book overlap -本の重なり- </string>を変形して名付けました。</p>

# 機能(技術)一覧

- ユーザー登録
  - ユーザー情報変更
  - パスワード変更(メール経由)
- 管理ユーザー機能
  - ユーザー削除
- メールでの認証機能（SendGrid）
- ログイン機能(session,cookie)
- 画像アップロード(Active Storage + AWS S3)
- 投稿の CRUD
- 検索機能(ransack)
- ページネーション(kaminari)
- DB(PostgreSQL)
- フロントデザイン(Bootstrap4)
- i18 による日本語対応
- rubocop & rspec による解析
