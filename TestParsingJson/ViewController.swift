//
//  ViewController.swift
//  TestParsingJson
//
//  Created by Алексей Гуляев on 25.06.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlString = "https://icodeschool.ru/json1.php"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
           //Проверяем что нет ошибки иначе выходим
            if let error = error {
                print(error)
                return
            }
            //Проверяем что дата успешно распакована
            guard let data = data else { return }
            
//            //хотим распечатать наш json как строку - для проверки
//            let jsonString = String(data: data, encoding: .utf8)
//            print(jsonString)
            
        /*
         декодируем наш json в привычный вид так как пока это выглядит примерно
         так:
                ▿ Optional<String>
         - some : "[{\"id\":1,\"name\":\"\\u0423\\u0440\\u043e\\u043a 1 - \\u041f\\u0435\\u0440\\u0435\\u043c\\u0435\\u043d\\u043d\\u044b\\u0435, \\u0422\\u0438\\u043f\\u044b \\u0414\\u0430\\u043d\\u043d\\u044b\\u0445\",\"date\":\"2020-10-25 12:34:00\",\"image\":\"https:\\/\\/i9.ytimg.com\\/vi\\/SQ1iVYvffuc\\/mqdefault.jpg?v=6007d1d2&sqp=CIjanogG&rs=AOn4CLDF1ATcqG9UIpueVyLZmrcbU6swtg\",\"link\":\"https:\\/\\/youtu.be\\/SQ1iVYvffuc\"},{\"id\":2,\"name\":\"\\u0423\\u0440\\u043e\\u043a 2 -
         
         Для того что бы корректно распарсить наш json, нам нужно предоставить
         методу decode - 1. шаблон по которому он будет распарсивать наш json
         и собственно нераскрытый json из переменной data
         
         Создадим шаблон в новом файле Model (model.swift) со структурой Lesson,
         поля должны точно (буква в букву совпадать названиями ключей JSON)
         
         */
            do {
                let lessons = try JSONDecoder().decode([Lesson].self, from: data)
                print(lessons.first?.name)
            } catch {
                //Если будет ошибка сработает этот блок
                print(error)
            }
        //запускаем наш запрос с помощью  - .resume()
        } .resume()
    }

}

