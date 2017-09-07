trait Monad<T> {
    fn unit(self, T) -> Self;
}

enum ID<T> {
    Value(T)
}



// impl Monad<T> for ID<T> { 
//     fn unit(self, x: T) -> Self {
//         return self;
//     }

// }


fn main() {
    let x = ID::Value(1);

}
