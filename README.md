# class_title_crawling
## 概要
- CourseraやUdemyなどオンライン授業の履修スケジュールを立てるときに、タイトルの一覧を取得するプログラム

## 環境設定
- 事前にchrome driverをインストールしておく(https://qiita.com/y-agatsuma/items/ea2c9845ee0a931d5c9c)
- gemをインストールする 。次のコマンドをターミナル上で入力`$ bundle install --path .bundle`
- .bundleに色々インストールされる

## 実行方法
- ターミナル上で本ディレクトリに移動し、次のコマンドを入力`$ bundle exec ruby coursera_parser.rb`
- その後取得したい授業のURLを入力(例では機械学習)`https://www.coursera.org/learn/machine-learning?`

## 取得先情報
- URLのトップページ
<div align="center">
  <img width="600px" src="https://github.com/Beluuuuuuga/class_title_parser/blob/master/image/top.png">
</div>
<div align="center"> 図1. URLのトップページ </div>

- 取得情報の終了までの時間と授業の内容
<div align="center">
  <img width="600px" src="https://github.com/Beluuuuuuga/class_title_parser/blob/master/image/time_title.png">
</div>
<div align="center"> 図2. 授業シラバス </div>

## 出力結果
- Coursera各授業のタイトルが出力CSVのタイトルになっています
- 終了までの時間と、科目の内容がCSVに書き込まれます

```
hour,content
2,Introduction
3,Linear Regression with Multiple Variables
2,Logistic Regression
5,Neural Networks: Representation
5,Neural Networks: Learning
5,Advice for Applying Machine Learning
5,Support Vector Machines
1,Unsupervised Learning
2,Anomaly Detection
1,Large Scale Machine Learning
1,Application Example: Photo OCR
```
