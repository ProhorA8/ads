import $ from 'jquery'
import 'select2/dist/js/select2'

// грузим документ
$(document).on("turbolinks:before-cache", function() {
    // берём элемент с таким классом
  $('.js-multiple-select').each(function () {
    $(this).select2('destroy');
  })
})

// грузим документ
$(document).on("turbolinks:load", function() {
  $('.js-multiple-select').each(function () {
      // кэшируем this
    const $this = $(this)

    let opts = {
        // тема
      theme: 'bootstrap-5',
        // если ширина есть то мы его берём
      width: $this.data("width") ? $this.data("width") : $this.hasClass("w-100") ? "100%" : "style",
      placeholder: $this.data("placeholder"),
        // очитска поля
      allowClear: Boolean($this.data("allow-clear"))
    }

    if($this.hasClass('js-ajax-select')) {
      const ajax_opts = {
        ajax: {
          url: $this.data('ajax-url'),
          data: function (params) {
              // отправляем асинхр. запр. только term
            return {
                // то что ввёл пользователь то и будем искать
              term: params.term
            }
          },
          dataType: 'json',
            // ждём секунду (мс)
          delay: 1000,
          processResults: function (data, params) {
            const arr = $.map(data, function(value, index){
              return {
                  // id из бд
                id: value.id,
                // заголовок тега
                text: value.name
              }
            })
            return {
                // возврат массива данных для пользователя
              results: arr
            }
          },
          cache: true
        },
          // поиск начинается минимум с 2-х символов
        minimumInputLength: 2
      }

      // пристыковываем новые опции к старым
      opts = Object.assign(opts, ajax_opts)
    }

    $this.select2(opts)
  })
})
