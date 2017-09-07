(function() {
    const Thing = function(x) {
        return { value: x };
    }

    const unit = function(x) { return new Thing(x); }
    const bind = function(fn, mx) { return fn(mx.value); }

    const addOne = function(x) { return unit(x + 1); }
    const timesTwo = function(x) { return unit(x * 2); }


    let mx = unit(1);

    const compose = function(f, g) {
        return function(mx) {
            return bind(f, bind(g, mx));
        }
    }

    console.log(
        bind(addOne, compose(addOne, timesTwo)(mx))
    );

    console.log(
        compose(addOne, addOne)(bind(timesTwo, mx))
    );

    // console.log(
    //     new Thing(1)
    // );

    // const unit = (l) => { return { val: l, db: [] }; };
    // const bind = (f, Mx) => { return Mx; };
    // let compose = function(f, g) {
    //     return (x) => { 
    //         return f.call([1,2,3]) 
    //     };
    // };

    // let x = unit([1,2,3]);

    // let y = compose(Array.prototype.pop, Array.prototype.pop);
    // console.log(
    //     y(
    //         [1,2,3]
    //     )
    // );

    // console.log(
    //     [1,2,3].pop()
    // )


    // console.log(y);
})()
