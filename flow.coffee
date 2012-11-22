class Flow
  defaultOptions:
    slidesSelector: '> *'

  constructor: (listSelector, options) ->
    @options = $.extend {}, @defaultOptions, options
    @list = $(listSelector)
    @slide = @list.find(@options.slidesSelector).eq(0)

  show: (slide) ->
    if $.isNumeric(slide)
      @_selectSlideByIndex(slide)
    else
      @_selectSlideBySelector(slide)
    @list.find(@options.slidesSelector).hide().filter(@slide).show()

  next: ->
    slide = if @slide.next().index() is -1 then 0 else @slide.next()
    @show(slide)

  prev: ->
    slide = if @slide.prev().index() is -1 then @size() - 1 else @slide.prev()
    @show(slide)

  first: ->
    @show(0)

  last: ->
    @show(@_size() - 1)

  prepend: (slideHtml) ->
    @list.prepend(slideHtml)

  append: (slideHtml) ->
    @list.append(slideHtml)

  _size: ->
    @list.find(@options.slidesSelector).size()

  _selectSlideByIndex: (index) ->
    @slide = @list.find(@options.slidesSelector).eq(index)

  _selectSlideBySelector: (selector) ->
    @slide = @list.find(@options.slidesSelector).filter(selector)
