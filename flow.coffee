class window.Flow
  defaultOptions:
    slidesSelector: '> *'

  constructor: (listSelector, options) ->
    @options = $.extend {}, @defaultOptions, options
    @list = $(listSelector)
    @slide = @slides().eq(0)

  slides: ->
    @list.find(@options.slidesSelector)

  show: (slide) ->
    if $.isNumeric(slide)
      @_selectSlideByIndex(slide)
    else
      @_selectSlideBySelector(slide)
    @slides().hide().filter(@slide).show()

  next: ->
    slide = if @slide.next().index() is -1 then 0 else @slide.next()
    @show(slide)

  prev: ->
    slide = if @slide.prev().index() is -1 then @size() - 1 else @slide.prev()
    @show(slide)

  first: ->
    @show(0)

  last: ->
    @show(@size() - 1)

  prepend: (slideHtml) ->
    @list.prepend(slideHtml)
    @show(@slide)

  append: (slideHtml) ->
    @list.append(slideHtml)
    @show(@slide)

  insert: (position, slideHtml) ->
    if position is 0
      @slides().eq(position).before(slideHtml)
    else
      @slides().eq(position - 1).after(slideHtml)
    @show(@slide)

  replace: (position, slideHtml) ->
    slide = if position is @slide.index() then position else @slide
    @slides().eq(position).before(slideHtml).remove()
    @show(slide)

  delete: (position) ->
    slide = @slide
    if position is slide.index()
      slide = if @slide.next().index() is -1 then 0 else @slide.next()
    @slides().eq(position).remove()
    @show(slide)

  size: ->
    @slides().size()

  _selectSlideByIndex: (index) ->
    @slide = @slides().eq(index)

  _selectSlideBySelector: (selector) ->
    @slide = @slides().filter(selector)
