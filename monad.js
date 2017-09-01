(function() {

    const unit = (l) => { return { val: l, db: [] }; };
    const bind = (f, Mx) => { return Mx; };
    let compose = function(f, g) {
        return (x) => { 
            return f.call([1,2,3]) 
        };
    };

    let x = unit([1,2,3]);

    let y = compose(Array.prototype.pop, Array.prototype.pop);
    console.log(
        y(
            [1,2,3]
        )
    );

    console.log(
        [1,2,3].pop()
    )


    // console.log(y);
})()
