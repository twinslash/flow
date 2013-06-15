window.Flow = window.Flow || (function() {

	function Flow( slides, startPosition ) {
		if ( typeof slides === "string" ) {
			this.slides = [].slice.call( document.querySelectorAll( slides ) );
		} else {
			this.slides = slides;
		}

		if ( typeof startPosition === "number" ) {
			this.show( startPosition );
		}
	}

	var FlowProto = Flow.prototype;

	FlowProto.show = function( position ) {
		if ( typeof position === "number" && !isNaN( position ) ) {
			return this.movement( this.currentPosition = position );
		} else {
			throw TypeError("Flow.show( position ) - position isn't a number");
		}
	};

	FlowProto.movement = function( position ) {
		var l = this.slides.length,
			i = 0;

		for ( ; i < l; i++ ) {
			this.slides[ i ].style.display = "none";
		}

		// @TODO: Need to set native display value instead of 'block'
		this.slides[ position ].style.display = "block";
	};

	// Controllers

	FlowProto.next = function() {
		return this.show( this.currentPosition + 1 === this.size() ? 0 : this.currentPosition + 1 );
	};

	FlowProto.prev = function() {
		return this.show( this.currentPosition === 0 ? this.size() - 1 : this.currentPosition - 1 );
	};

	FlowProto.first = function() {
		return this.show( 0 );
	};

	FlowProto.last = function() {
		return this.show( this.size() - 1 );
	};

	// Secondary

	FlowProto.size = function() {
		return this.slides.length;
	};

	return Flow;

})();
