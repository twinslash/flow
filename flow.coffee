class window.Flow
  defaultOptions:
    slidesSelector: '> *'

  constructor: (listSelector, options) ->
    @options = $.extend {}, @defaultOptions, options
    @list = $(listSelector)

  slides: ->
    @list.find(@options.slidesSelector)

  # Motion

  show: (query) ->
    @slide = @getSlide(query)
    @slides().hide().filter(@slide).show()

  next: ->
    @show @getNextSlidePosition()

  prev: ->
    @show @getPrevSlidePosition()

  first: ->
    @show 0

  last: ->
    @show @size() - 1

  # Secondary

  size: ->
    @slides().size()

  getCurrentSlidePosition: (element = @slide) ->
    slide = element
    currentIndex = -1
    $.each @slides(), (index) ->
      if slide.get(0) is this
        currentIndex = index
    currentIndex

  getNextSlidePosition: ->
    currentIndex = @getCurrentSlidePosition()
    index = if currentIndex + 1 is @size() then 0 else currentIndex + 1

  getPrevSlidePosition: ->
    currentIndex = @getCurrentSlidePosition()
    index = if currentIndex is 0 then @size() - 1 else currentIndex - 1

  getSlide: (query) ->
    if $.isNumeric(query)
      @slide = @slides().eq(query)
    else if toString.call(query) is '[object String]'
      @slide = @slides().filter(query)
    else
      @slide = query

  # DOM manipulation

  prepend: (slideHtml) ->
    @slides().first().before(slideHtml)
    @show @slide

  append: (slideHtml) ->
    @slides().last().after(slideHtml)
    @show @slide

  insert: (position, slideHtml) ->
    if position is 0
      @slides().eq(position).before(slideHtml)
    else
      @slides().eq(position - 1).after(slideHtml)
    @show @slide

  replace: (position, slideHtml) ->
    slide = if @getCurrentSlidePosition() is position then position else @slide
    @slides().eq(position).before(slideHtml).remove()
    @show slide

  delete: (position) ->
    if @getCurrentSlidePosition() is position
      slide = if @size() - 1 is position then 0 else @getCurrentSlidePosition()
    else
      slide = @slide
    @slides().eq(position).remove()
    @show slide
