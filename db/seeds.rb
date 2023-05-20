# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

ActiveRecord::Base.transaction do
  regions = Services::AdministrationDivisions::Regions::Receive.call.value.sort

  regions.each do |region|
    region = Region.create(name: region)
    cities = Services::AdministrationDivisions::Cities::Receive.call(region.name).value
    cities.each do |city|
      region_city = region.cities.build(name: city)
      region_city.save
    end
  end

  Category.create(name: 'Недвижимость',
                  icon: 'M2.25 12l8.954-8.955c.44-.439 1.152-.439 1.591 0L21.75 12M4.5 9.75v10.125c0 .621.504 1.125 1.125 1.125H9.75v-4.875c0-.621.504-1.125 1.125-1.125h2.25c.621 0 1.125.504 1.125 1.125V21h4.125c.621 0 1.125-.504 1.125-1.125V9.75M8.25 21h8.25')
  Subcategory.create(name: 'Квартиры', category: Category.find_by(name: 'Недвижимость'))
  CategorySetting.create(name: 'Тип сделки', values_type: 'radio', required: true,
                         subcategory: Subcategory.find_by(name: 'Квартиры'))
  SettingValue.create(value: 'Продажа', category_setting: CategorySetting.last)
  SettingValue.create(value: 'Сдача', category_setting: CategorySetting.last)
  CategorySetting.create(name: 'Количество комнат', values_type: 'radio', required: true,
                         subcategory: Subcategory.find_by(name: 'Квартиры'))
  SettingValue.create(value: '1', category_setting: CategorySetting.last)
  SettingValue.create(value: '2', category_setting: CategorySetting.last)
  SettingValue.create(value: '3', category_setting: CategorySetting.last)
  SettingValue.create(value: '4', category_setting: CategorySetting.last)
  SettingValue.create(value: '5 и более', category_setting: CategorySetting.last)
  CategorySetting.create(name: 'Количество комнат', values_type: 'radio', required: true,
                         subcategory: Subcategory.find_by(name: 'Квартиры'))
  SettingValue.create(value: '1', category_setting: CategorySetting.last)
  SettingValue.create(value: '2', category_setting: CategorySetting.last)
  SettingValue.create(value: '3', category_setting: CategorySetting.last)
  SettingValue.create(value: '4', category_setting: CategorySetting.last)
  SettingValue.create(value: '5 и более', category_setting: CategorySetting.last)
  CategorySetting.create(name: 'Общая площадь, кв.м', values_type: 'text', required: false,
                         subcategory: Subcategory.find_by(name: 'Квартиры'))
  CategorySetting.create(name: 'Жилая площадь, кв.м', values_type: 'text', required: false,
                         subcategory: Subcategory.find_by(name: 'Квартиры'))
  CategorySetting.create(name: 'Площадь кухни, кв.м', values_type: 'text', required: false,
                         subcategory: Subcategory.find_by(name: 'Квартиры'))
  CategorySetting.create(name: 'Санузел', values_type: 'radio', required: false,
                         subcategory: Subcategory.find_by(name: 'Квартиры'))
  SettingValue.create(value: 'Раздельный', category_setting: CategorySetting.last)
  SettingValue.create(value: 'Совмещенный', category_setting: CategorySetting.last)
  SettingValue.create(value: 'Два', category_setting: CategorySetting.last)
  SettingValue.create(value: 'Три', category_setting: CategorySetting.last)
  CategorySetting.create(name: 'Балкон', values_type: 'radio', required: false,
                         subcategory: Subcategory.find_by(name: 'Квартиры'))
  SettingValue.create(value: 'Есть', category_setting: CategorySetting.last)
  SettingValue.create(value: 'Нет', category_setting: CategorySetting.last)
  SettingValue.create(value: 'Лоджия', category_setting: CategorySetting.last)
  SettingValue.create(value: 'Два', category_setting: CategorySetting.last)
  CategorySetting.create(name: 'Высота потолков', values_type: 'radio', required: false,
                         subcategory: Subcategory.find_by(name: 'Квартиры'))
  SettingValue.create(value: 'от 2.5 м', category_setting: CategorySetting.last)
  SettingValue.create(value: 'от 2.7 м', category_setting: CategorySetting.last)
  SettingValue.create(value: 'от 3 м', category_setting: CategorySetting.last)
  SettingValue.create(value: 'от 3.5 м', category_setting: CategorySetting.last)
  SettingValue.create(value: 'от 4 м', category_setting: CategorySetting.last)
  CategorySetting.create(name: 'Ремонт', values_type: 'radio', required: false,
                         subcategory: Subcategory.find_by(name: 'Квартиры'))
  SettingValue.create(value: 'Косметический', category_setting: CategorySetting.last)
  SettingValue.create(value: 'Евро', category_setting: CategorySetting.last)
  SettingValue.create(value: 'Дизайнерский', category_setting: CategorySetting.last)
  SettingValue.create(value: 'Строительная отделка', category_setting: CategorySetting.last)
  SettingValue.create(value: 'Без отделки', category_setting: CategorySetting.last)
  SettingValue.create(value: 'Аварийное состояние', category_setting: CategorySetting.last)

  Subcategory.create(name: 'Комнаты', category: Category.find_by(name: 'Недвижимость'))
  CategorySetting.create(name: 'Тип сделки', values_type: 'radio', required: true,
                         subcategory: Subcategory.find_by(name: 'Комнаты'))
  SettingValue.create(value: 'Продажа', category_setting: CategorySetting.last)
  SettingValue.create(value: 'Сдача', category_setting: CategorySetting.last)
  CategorySetting.create(name: 'Количество комнат', values_type: 'radio', required: true,
                         subcategory: Subcategory.find_by(name: 'Комнаты'))
  SettingValue.create(value: '1', category_setting: CategorySetting.last)
  SettingValue.create(value: '2', category_setting: CategorySetting.last)
  SettingValue.create(value: '3', category_setting: CategorySetting.last)
  SettingValue.create(value: '4', category_setting: CategorySetting.last)
  SettingValue.create(value: '5 и более', category_setting: CategorySetting.last)
  CategorySetting.create(name: 'Количество комнат', values_type: 'radio', required: true,
                         subcategory: Subcategory.find_by(name: 'Комнаты'))
  SettingValue.create(value: '1', category_setting: CategorySetting.last)
  SettingValue.create(value: '2', category_setting: CategorySetting.last)
  SettingValue.create(value: '3', category_setting: CategorySetting.last)
  SettingValue.create(value: '4', category_setting: CategorySetting.last)
  SettingValue.create(value: '5 и более', category_setting: CategorySetting.last)
  CategorySetting.create(name: 'Общая площадь, кв.м', values_type: 'text', required: false,
                         subcategory: Subcategory.find_by(name: 'Комнаты'))
  CategorySetting.create(name: 'Жилая площадь, кв.м', values_type: 'text', required: false,
                         subcategory: Subcategory.find_by(name: 'Комнаты'))
  CategorySetting.create(name: 'Площадь кухни, кв.м', values_type: 'text', required: false,
                         subcategory: Subcategory.find_by(name: 'Комнаты'))
  CategorySetting.create(name: 'Санузел', values_type: 'radio', required: false,
                         subcategory: Subcategory.find_by(name: 'Комнаты'))
  SettingValue.create(value: 'Раздельный', category_setting: CategorySetting.last)
  SettingValue.create(value: 'Совмещенный', category_setting: CategorySetting.last)
  SettingValue.create(value: 'Два', category_setting: CategorySetting.last)
  SettingValue.create(value: 'Три', category_setting: CategorySetting.last)
  CategorySetting.create(name: 'Балкон', values_type: 'radio', required: false,
                         subcategory: Subcategory.find_by(name: 'Комнаты'))
  SettingValue.create(value: 'Есть', category_setting: CategorySetting.last)
  SettingValue.create(value: 'Нет', category_setting: CategorySetting.last)
  SettingValue.create(value: 'Лоджия', category_setting: CategorySetting.last)
  SettingValue.create(value: 'Два', category_setting: CategorySetting.last)
  CategorySetting.create(name: 'Высота потолков', values_type: 'radio', required: false,
                         subcategory: Subcategory.find_by(name: 'Комнаты'))
  SettingValue.create(value: 'от 2.5 м', category_setting: CategorySetting.last)
  SettingValue.create(value: 'от 2.7 м', category_setting: CategorySetting.last)
  SettingValue.create(value: 'от 3 м', category_setting: CategorySetting.last)
  SettingValue.create(value: 'от 3.5 м', category_setting: CategorySetting.last)
  SettingValue.create(value: 'от 4 м', category_setting: CategorySetting.last)
  CategorySetting.create(name: 'Ремонт', values_type: 'radio', required: false,
                         subcategory: Subcategory.find_by(name: 'Комнаты'))
  SettingValue.create(value: 'Косметический', category_setting: CategorySetting.last)
  SettingValue.create(value: 'Евро', category_setting: CategorySetting.last)
  SettingValue.create(value: 'Дизайнерский', category_setting: CategorySetting.last)
  SettingValue.create(value: 'Строительная отделка', category_setting: CategorySetting.last)
  SettingValue.create(value: 'Без отделки', category_setting: CategorySetting.last)
  SettingValue.create(value: 'Аварийное состояние', category_setting: CategorySetting.last)
  CategorySetting.create(name: 'Наличие мебели', values_type: 'radio', required: false,
                         subcategory: Subcategory.find_by(name: 'Комнаты'))
  SettingValue.create(value: 'Да', category_setting: CategorySetting.last)
  SettingValue.create(value: 'Нет', category_setting: CategorySetting.last)

  Category.create(name: 'Авто и транспорт',
                  icon: 'M8.25 18.75a1.5 1.5 0 01-3 0m3 0a1.5 1.5 0 00-3 0m3 0h6m-9 0H3.375a1.125 1.125 0 01-1.125-1.125V14.25m17.25 4.5a1.5 1.5 0 01-3 0m3 0a1.5 1.5 0 00-3 0m3 0h1.125c.621 0 1.129-.504 1.09-1.124a17.902 17.902 0 00-3.213-9.193 2.056 2.056 0 00-1.58-.86H14.25M16.5 18.75h-2.25m0-11.177v-.958c0-.568-.422-1.048-.987-1.106a48.554 48.554 0 00-10.026 0 1.106 1.106 0 00-.987 1.106v7.635m12-6.677v6.677m0 4.5v-4.5m0 0h-12')
  Subcategory.create(name: 'Легковые авто', category: Category.find_by(name: 'Авто и транспорт'))
  CategorySetting.create(name: 'Марка', values_type: 'select', required: true,
                         subcategory: Subcategory.find_by(name: 'Легковые авто'))
  brands = Services::Cars::Makes::Receive.call.value.sort
  brands.each do |brand|
    SettingValue.create(value: brand, category_setting: CategorySetting.last)
  end
  CategorySetting.create(name: 'Модель', values_type: 'text', required: false,
                         subcategory: Subcategory.find_by(name: 'Легковые авто'))
  CategorySetting.create(name: 'Поколение', values_type: 'text', required: false,
                         subcategory: Subcategory.find_by(name: 'Легковые авто'))
  CategorySetting.create(name: 'Тип кузова', values_type: 'select', required: true,
                         subcategory: Subcategory.find_by(name: 'Легковые авто'))
  SettingValue.create(value: 'Лимузин', category_setting: CategorySetting.last)
  SettingValue.create(value: 'Седан', category_setting: CategorySetting.last)
  SettingValue.create(value: 'Универсал', category_setting: CategorySetting.last)
  SettingValue.create(value: 'Хэтчбек', category_setting: CategorySetting.last)
  SettingValue.create(value: 'Минивен', category_setting: CategorySetting.last)
  SettingValue.create(value: 'Внедорожник', category_setting: CategorySetting.last)
  SettingValue.create(value: 'Купе', category_setting: CategorySetting.last)
  SettingValue.create(value: 'Кабриолет', category_setting: CategorySetting.last)
  SettingValue.create(value: 'Микроавтобус', category_setting: CategorySetting.last)
  SettingValue.create(value: 'Фургон', category_setting: CategorySetting.last)
  SettingValue.create(value: 'Пикап', category_setting: CategorySetting.last)
  CategorySetting.create(name: 'Цвет', values_type: 'text', required: false,
                         subcategory: Subcategory.find_by(name: 'Легковые авто'))
  CategorySetting.create(name: 'Тип двигателя', values_type: 'radio', required: true,
                         subcategory: Subcategory.find_by(name: 'Легковые авто'))
  SettingValue.create(value: 'Бензин', category_setting: CategorySetting.last)
  SettingValue.create(value: 'Дизель', category_setting: CategorySetting.last)
  SettingValue.create(value: 'Газ', category_setting: CategorySetting.last)
  SettingValue.create(value: 'Гибрид', category_setting: CategorySetting.last)
  SettingValue.create(value: 'Электромобиль', category_setting: CategorySetting.last)
  CategorySetting.create(name: 'Тип двигателя', values_type: 'radio', required: true,
                         subcategory: Subcategory.find_by(name: 'Легковые авто'))
  SettingValue.create(value: 'Бензин', category_setting: CategorySetting.last)
  SettingValue.create(value: 'Дизель', category_setting: CategorySetting.last)
  SettingValue.create(value: 'Газ', category_setting: CategorySetting.last)
  SettingValue.create(value: 'Гибрид', category_setting: CategorySetting.last)
  SettingValue.create(value: 'Электромобиль', category_setting: CategorySetting.last)
  CategorySetting.create(name: 'Привод', values_type: 'radio', required: false,
                         subcategory: Subcategory.find_by(name: 'Легковые авто'))
  SettingValue.create(value: 'Передний', category_setting: CategorySetting.last)
  SettingValue.create(value: 'Задний', category_setting: CategorySetting.last)
  SettingValue.create(value: 'Полный', category_setting: CategorySetting.last)
  CategorySetting.create(name: 'Коробка передач', values_type: 'radio', required: true,
                         subcategory: Subcategory.find_by(name: 'Легковые авто'))
  SettingValue.create(value: 'Автомат', category_setting: CategorySetting.last)
  SettingValue.create(value: 'Механика', category_setting: CategorySetting.last)
  CategorySetting.create(name: 'Пробег', values_type: 'text', required: true,
                         subcategory: Subcategory.find_by(name: 'Легковые авто'))
  Subcategory.create(name: 'Мотоцикл', category: Category.find_by(name: 'Авто и транспорт'))
  CategorySetting.create(name: 'Марка', values_type: 'select', required: true,
                         subcategory: Subcategory.find_by(name: 'Мотоцикл'))
  brands = Services::Motorcycles::Makes::Receive.call.value.sort
  brands.each do |brand|
    SettingValue.create(value: brand, category_setting: CategorySetting.last)
  end
  CategorySetting.create(name: 'Тип мотоцикла', values_type: 'select', required: true,
                         subcategory: Subcategory.find_by(name: 'Мотоцикл'))
  categories = Services::Motorcycles::Categories::Receive.call.value.sort
  categories.each do |category|
    SettingValue.create(value: category, category_setting: CategorySetting.last)
  end
  CategorySetting.create(name: 'Привод', values_type: 'radio', required: true,
                         subcategory: Subcategory.find_by(name: 'Мотоцикл'))
  SettingValue.create(value: 'Кардан', category_setting: CategorySetting.last)
  SettingValue.create(value: 'Ремень', category_setting: CategorySetting.last)
  SettingValue.create(value: 'Цепь', category_setting: CategorySetting.last)
  CategorySetting.create(name: 'Число тактов', values_type: 'radio', required: true,
                         subcategory: Subcategory.find_by(name: 'Мотоцикл'))
  SettingValue.create(value: '2', category_setting: CategorySetting.last)
  SettingValue.create(value: '4', category_setting: CategorySetting.last)
  CategorySetting.create(name: 'Количество цилиндров', values_type: 'radio', required: true,
                         subcategory: Subcategory.find_by(name: 'Мотоцикл'))

  SettingValue.create(value: '1', category_setting: CategorySetting.last)
  SettingValue.create(value: '2', category_setting: CategorySetting.last)
  SettingValue.create(value: '3', category_setting: CategorySetting.last)
  SettingValue.create(value: '4', category_setting: CategorySetting.last)
  SettingValue.create(value: '6', category_setting: CategorySetting.last)
  CategorySetting.create(name: 'Пробег', values_type: 'text', required: true,
                         subcategory: Subcategory.find_by(name: 'Мотоцикл'))
end
