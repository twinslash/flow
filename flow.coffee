class window.Flow
  defaultOptions:
    slidesSelector: '> *'

  constructor: (listSelector, options) ->
    @options = $.extend {}, @defaultOptions, options
    @list = $(listSelector)
    @slide = @list.find(@options.slidesSelector).eq(0)

  show: (slide) =>
    if $.isNumeric(slide)
      @_selectSlideByIndex(slide)
    else
      @_selectSlideBySelector(slide)
    @list.find(@options.slidesSelector).hide().filter(@slide).show()

  next: =>
    slide = if @slide.next().index() is -1 then 0 else @slide.next()
    @show(slide)

  prev: =>
    slide = if @slide.prev().index() is -1 then @_size() - 1 else @slide.prev()
    @show(slide)

  first: =>
    @show(0)

  last: =>
    @show(@_size() - 1)

  prepend: (slideHtml) =>
    @list.prepend(slideHtml)
    @show(@slide)

  append: (slideHtml) =>
    @list.append(slideHtml)
    @show(@slide)

  insert: (position, slideHtml) =>
    if position is 0
      @list.find(@options.slidesSelector).eq(position).before(slideHtml)
    else
      @list.find(@options.slidesSelector).eq(position - 1).after(slideHtml)
    @show(@slide)

  replace: (position, slideHtml) =>
    slide = if position is @slide.index() then position else @slide
    @list.find(@options.slidesSelector).eq(position).before(slideHtml).remove()
    @show(slide)

  delete: (position) =>
    if position is @slide.index()
      @next()
    @list.find(@options.slidesSelector).eq(position).remove()

  _size: ->
    @list.find(@options.slidesSelector).size()

  _selectSlideByIndex: (index) ->
    @slide = @list.find(@options.slidesSelector).eq(index)

  _selectSlideBySelector: (selector) ->
    @slide = @list.find(@options.slidesSelector).filter(selector)
