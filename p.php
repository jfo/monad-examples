<?

interface Monad {
    public static function unit($x);
    public function bind($fn);
}

class ID implements Monad {

    private $value;

    private function __construct($n) {
        $this->value = $n;
    }

    public static function unit($x) {
        return new ID($x);
    }

    public function bind($fn) {
        return self::unit($fn($this->value));
    }

}

$m = ID::unit(1);

$increment = function($n) { return $n + 1; };
var_dump($m->bind($increment));
var_dump($m);

