# Flow
Flow is simple javascript slider for developers. __Still under development. NOT READY for production.__

## Example
Suppose you have such html:
```html
<a class="prev-button" href="#">Prev</a>
<ul class="slider">
    <li class="slide">
        <img src="img/octocat.jpg">
    </li>
    <li class="slide">
        <img src="img/bender.jpg">
    </li>
    <li class="slide">
        <img src="img/sheldon.jpg">
    </li>
</ul>
<a class="next-button" href="#">Next</a>
```
Now you can use Flow to slide it like a pro
```coffee
slider = new Flow '.slider' # ready to show children of $('.slider') element
# the first slide will be shown automatically

# switch slides by clicks on buttons
$('.prev-button').on 'click', -> slider.prev()
$('.next-button').on 'click', -> slider.next()
```

## Dependencies
* jQuery

## TODO
* Write tests
* Documentation
* Animation

## Contribution
Feel free to fork and pull request.

## License
Flow distributed under MIT license.
