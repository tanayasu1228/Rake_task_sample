require 'csv'

namespace :import_csv do
  desc "CSVデータをインポートするタスク"
# タスク名は users
  task users: :environment do
# インポートするファイルのパスを取得
    path = File.join Rails.root, "db/csv_data/csv_data.csv"
# インポートするデータを格納するための配列
    list = []
# CSVファイルからインポートするデータを取得し配列に格納
    CSV.foreach(path, headers: true) do |row|
      list << {
          name: row["name"],
          age: row["age"],
          address: row["address"]
      }
    end
    puts "インポート処理を開始".red

    begin
      User.transaction do
       # 例外が発生する可能性のある処理
        User.create!(list)
      end
       # 正常に動作した場合の処理
      puts "インポート完了!!".green
       # 例外処理
    rescue ActiveModel::UnknownAttributeError => invalid
       # 例外が発生した場合の処理
       # インポートができなかった場合の例外処理
      puts "インポートに失敗：UnknownAttributeError".red
    end
  end
end
