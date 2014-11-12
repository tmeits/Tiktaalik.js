var RTL$ = {
    extend: function extend(methods){
        function Type(){
            for(var m in methods)
                this[m] = methods[m];
        }
        Type.prototype = this.prototype;

        var result = methods.init;
        result.prototype = new Type(); // inherit this.prototype
        result.prototype.constructor = result; // to see constructor name in diagnostic
        
        result.extend = extend;
        return result;
    },
    makeArray: function (/*dimensions, initializer*/){
        var forward = Array.prototype.slice.call(arguments);
        var result = new Array(forward.shift());
        var i;
        if (forward.length == 1){
            var init = forward[0];
            if (typeof init == "function")
                for(i = 0; i < result.length; ++i)
                    result[i] = init();
            else
                for(i = 0; i < result.length; ++i)
                    result[i] = init;
        }
        else
            for(i = 0; i < result.length; ++i)
                result[i] = this.makeArray.apply(this, forward);
        return result;
    }
};
var Control = function (JS){
var NMAX = 52;
var PMAX = 978;
var DMAX = 6;
var GAControl = RTL$.extend({
	init: function GAControl(){
		this.np = 0;
		this.ngen = 0;
		this.ndig = 0;
		this.pcross = 0;
		this.imut = 0;
		this.pmut = 0;
		this.pmutmn = 0;
		this.pmutmx = 0;
		this.fdif = 0;
		this.irep = 0;
		this.ielite = 0;
		this.ivrb = 0;
	}
});
var GACtl = new GAControl();

function Default(){
	GACtl.np = PMAX;
	GACtl.ngen = 500;
	GACtl.ndig = 6;
	GACtl.pcross = 0.85;
	GACtl.imut = 2;
	GACtl.pmut = 0.005;
	GACtl.pmutmn = 0.0005;
	GACtl.pmutmx = 0.25;
	GACtl.fdif = 1;
	GACtl.irep = 2;
	GACtl.ielite = 0;
	GACtl.ivrb = 0;
}
Default();
return {
	NMAX: NMAX,
	PMAX: PMAX,
	DMAX: DMAX,
	GAControl: GAControl,
	Default: Default
}
}(this);
