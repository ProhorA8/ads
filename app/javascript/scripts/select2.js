import $ from 'jquery'
import 'select2/dist/js/select2'
// файды жолжны подключатся автоматически, плохо работает с webpacker-ом
import * as Select2Ru from 'select2/src/js/select2/i18n/ru'
import * as Select2En from 'select2/src/js/select2/i18n/en'

// самостоятельная установка языка
const select2_langs = {
  ru: Select2Ru,
  en: Select2En
}

// ждем загрузки документа
$(document).on("turbolinks:before-cache", function() {
  // удаление элемента с таким классом
  $('.js-multiple-select').each(function () {
    $(this).select2('destroy');
  })
})

// ждем загрузки документа
$(document).on("turbolinks:load", function() {
  // берём каждый элемент с таким классом
  $('.js-multiple-select').each(function () {
    // закешируем this
    const $this = $(this)

    let opts = {
      // тема
      theme: 'bootstrap-5',
      // ширина, если передана, то используем её
      width: $this.data("width") ? $this.data("width") : $this.hasClass("w-100") ? "100%" : "style",
      // контроль плейсхолдера
      placeholder: $this.data("placeholder"),
      // очистка поля
      allowClear: Boolean($this.data("allow-clear")),
      // передаём опцию, брать из массива язык из data-lang атрибуда в body
      language: select2_langs[$('body').data('lang')]
    }

    // асинхронный запрос тегов по необходимости
    // https://select2.org/data-sources/ajax
    if($this.hasClass('js-ajax-select')) {
      // опции для аякса
      const ajax_opts = {
        ajax: {
          url: $this.data('ajax-url'),
          // данные которые мы хотим отправлять
          data: function (params) {
            // только term – ввод с клавиатуры
            return {
              term: params.term
            }
          },
          // формат
          dataType: 'json',
          // ожидание  1 с. после ввода
          delay: 1000,
          processResults: function (data, params) {
            // данные которые вернёт сервер
            const arr = $.map(data, function(value, index){
              return {
                // id из БД
                id: value.id,
                // заголовок тега
                text: value.name
              }
            })
            // требование select2, вернуть массив данных для отрисовки
            return {
              results: arr
            }
          },
          // кеширование
          cache: true
        },
        // минимальное количество символов для начала поиска тега
        minimumInputLength: 2
      }

      // пристыковать полученные опции ajax_opts к опциям полученным выше opts
      opts = Object.assign(opts, ajax_opts)
    }

    $this.select2(opts)
  })
})