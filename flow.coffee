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
    @slide = @_getSlide(query)
    @slides().hide()
    @slide.show()

  next: ->
    @show @_getNextSlidePosition()

  prev: ->
    @show @_getPrevSlidePosition()

  first: ->
    @show 0

  last: ->
    @show @size() - 1

  # Secondary

  size: ->
    @slides().size()

  _getCurrentSlidePosition: (slide = @slide) ->
    currentPosition = -1
    $.each @slides(), (index, element) ->
      if slide.get(0) is element
        currentPosition = index
    currentPosition

  _getNextSlidePosition: ->
    currentPosition = @_getCurrentSlidePosition()
    if currentPosition + 1 is @size() then 0 else currentPosition + 1

  _getPrevSlidePosition: ->
    currentPosition = @_getCurrentSlidePosition()
    if currentPosition is 0 then @size() - 1 else currentPosition - 1

  _getSlide: (query) ->
    if $.isNumeric(query)
      @slides().eq(query)
    else if toString.call(query) is '[object String]'
      @slides().filter(query)
    else
      query

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
    slide = if @_getCurrentSlidePosition() is position then position else @slide
    @slides().eq(position).before(slideHtml).remove()
    @show slide

  delete: (position) ->
    if @_getCurrentSlidePosition() is position
      slide = if @size() - 1 is position then 0 else @_getCurrentSlidePosition()
    else
      slide = @slide
    @slides().eq(position).remove()
    @show slide
