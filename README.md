# Flow
Flow is simple javascript slider for developers.

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
```js
var slider = new Flow('.slider li', {
	startPosition: 0
});

// switch slides by clicks on buttons
document.querySelector('.next-button').addEventListener('click', slider.next.bind(slider), false);
document.querySelector('.prev-button').addEventListener('click', slider.prev.bind(slider), false);
```

## TODO
* Write tests
* Documentation

## Contribution
Feel free to fork and pull request.

## License
Flow distributed under MIT license.
