# представление
# массив для каждого элемента выводим id и name тега
# названия полей для JSON: json.id, json.name
# результат:
# {
#   id: 1,
#   name: 'test'
# }
# который обрабатывается в processResults в scripts/select2.js
json.array! @tags do |tag|
  json.id tag.id
  json.name tag.name
end
