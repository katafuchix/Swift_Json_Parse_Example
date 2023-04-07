//
//  ContentView.swift
//  Swift_Json_Parse_Example
//
//  Created by cano on 2023/04/08.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button("Get RandomUser", action: {
                //  RANDOM USER GENERATORのAPIにアクセスし、APIの結果をJSONで取得
                let str : String = "https://randomuser.me/api"
                let url : URL = URL(string: str)!
                
                // URLRequestを生成してJSONのデータを取得
                let request: URLRequest = URLRequest(url:url)
                let session = URLSession.shared
                let task : URLSessionDataTask = session.dataTask(with: request, completionHandler: {(data, response, error) in
                    // エラーがあれば表示
                    if(error != nil) {
                        print(error ?? "")
                        return
                    }
                    
                    // APIからの戻り値がなければ処理を終了
                    guard let responseData = data else{ return }
                    
                    do {
                        print(responseData)
                        // JSONDecoderクラスのインスタンスを生成
                        let decoder = JSONDecoder()
                        // JSONを解析して作成した構造体の通りにマッピング
                        let resultList = try decoder.decode(ResultListModel.self, from: responseData)
                        print(resultList)
                        
                        // JSONを解析した後、Person構造体にマッピングされたデータを取り出す
                        for person in resultList.results {
                            print(person.gender)
                            print(person.name.title)
                            print(person.location.state)
                            print(person.email)
                        }
                    } catch {
                        print("JSONの解析でエラーが起きました")
                    }
                })
                task.resume()
                
            })
        }
        .padding()
        .task {

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
