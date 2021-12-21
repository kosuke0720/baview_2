# 【アプリ名】  Baview

# 【アプリケーション概要】

## 【開発コンセプト】
* **どんなアプリ？（内容）**  
赤ちゃん個人としての思い出の記録、使わなくなったもののお下がりができるツール  
* **どんなターゲット層に**  
赤ちゃんを育てる親御さん、特に二人以上育てる親御さん  
* **どんなニーズ&課題に**  
もののお下がりができる人が身近にいない人のために、簡単にお下がりができるようにしたい。  
赤ちゃん自身が後で思い出を見返すのに、自分自身の思い出として記録されているものがあって欲しい。  
* **なぜ？何のために？（開発理由・経緯）**  
自分自身が、思い出の写真が兄のものと一緒くたになって知っているものが多く、少し悲しい気持ちがあった。  
自分のためにまとめられたアルバムが手軽に更新できるものなら、いろんな赤ちゃんが自分のためのアルバムを持てると思った。  
また、友人夫妻がお下がりによるものの授受が簡単にできたら便利だと言っていたため、相手の顔がわかるやりとりが実現できたらと考えた。。  
## 【実装機能・内容】
* **必要最低限**  
  * 写真、写真のキャプションを記録できる  
  * お下がりの品を売買できる  
* **＋a**  
  * 商品のカテゴリ検索  
  * 買い物をした際の、売主、買主とのチャット機能  
  * 思い出へのイイね機能  

## 【URL】

## 【テスト用アカウント】

## 【利用方法】

## 【要件】

## 【ローカル動作】

# 【アクションプラン】
スキル面：基本的なrailsによるWEB構築の復習  
マインド面：個人による実装の実習  

・アプリ構想：11/23 ~ 11/28  
・DB設計：11/28 ~ 12/5  
・フロント実装：12/6 ~ 12/12  
・必要最低限機能実装：12/13 ~ 12/26  
・追加機能実装：12/27 ~ 1/17  
・デプロイ・動作確認・ビュー調整：1/18 ~ 2/1  


# DB設計  

## Users

|Column                   |Type    |Options                   |
|-------------------------|--------|--------------------------|
|nickname                 |string  |null: false               |
|email                    |string  |null: false, unique:true  |
|encrypted_password       |string  |null: false               |

has_many :favorites  
has_many :babies  
has_many :orders  
has_many :items  
has_many :messages  



## Babies  

|Column                   |Type    |Options                   |
|-------------------------|--------|--------------------------|
|baby_name                |string  |null: false               |
|birth_date               |string  |null: false, unique:true  |

belongs_to :user  
has_many :articles  
has_many :items



## Favorites  

|Column                   |Type    |Options                   |
|-------------------------|--------|--------------------------|
|user_id                  |string  |null: false               |
|article_id               |string  |null: false, unique:true  |

belongs_to :user  
belongs_to :articles  



## Articles  

|Column                   |Type        |Options                         |
|-------------------------|------------|--------------------------------|
|baby_id                  |references  |null: false, foreign_key: true  |
|content_date             |string      |null: false                     |
|content                  |text        |null: false                     |

belongs_to :baby  
has_many :favorites  



## Items

|Column          |Type        |Options                         |
|----------------|------------|--------------------------------|
|user_id         |references  |null: false, foreign_key: true  |
|item_name       |string      |null: false                     |
|price           |integer     |null: false                     |
|introduce       |text        |null: false                     |
|category_id     |integer     |null: false                     |
|items_status_id |integer     |null: false                     |
|send_fee_id     |integer     |null: false                     |

belongs_to :user  
has_one :order  



## Addresses

|Column          |Type        |Options                         |
|----------------|------------|--------------------------------|
|order_id        |references  |null: false, foreign_key: true  |
|zip_code        |string      |null: false                     |
|prefecture_id   |integer     |null: false                     |
|city            |string      |null: false                     |
|address         |string      |null: false                     |
|building_name   |string      |                                |
|phone_number    |string      |null: false                     |

has_one :order

## Orders

|Column          |Type        |Options                         |
|----------------|------------|--------------------------------|
|user_id         |references  |null: false, foreign_key: true  |
|item_id         |references  |null: false, foreign_key: true  |

belongs_to :user  
has_one :items  
has_one :rooms  
has_one :address  



## rooms

|Column          |Type        |Options                         |
|----------------|------------|--------------------------------|
|order_id        |references  |null: false, foreign_key: true  |

has_one :orders  
has_many :messages  



## messages

|Column          |Type        |Options                         |
|----------------|------------|--------------------------------|
|order_id        |references  |null: false, foreign_key: true  |
|order_id        |references  |null: false, foreign_key: true  |
|message         |references  |null: false                     |

has_one :rooms  
belongs_to :user  



