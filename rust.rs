trait Monad<T> {
    fn unit(self, T) -> Self;
}

#[derive(Debug)]
pub enum ID<T> {
    Value(T)
}

impl Monad<i32> {

}


fn main() {

}
