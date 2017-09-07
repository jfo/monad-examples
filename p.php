<?php

interface Monad {
    public static function unit($x);
    public function bind(callable $fn);
}

class ID implements Monad {

    private $value;

    private function __construct($n) {
        $this->value = $n;
    }

    public static function unit($x) {
        return new ID($x);
    }

    public function bind(callable $fn) {
        return $fn($this->value);
    }

    public function compose(callable $g, callable $f) {
        return $g($this->value)->bind($f);
    }
}

$increment = function($n) { return ID::unit($n + 1); };
$times2    = function($n) { return ID::unit($n * 2); };

var_dump(
    ID::unit(1)->bind($increment) == $increment(1)
);

var_dump(
    ID::unit(1)->bind("ID::unit") == ID::unit(1)
);

var_dump(
    ID::unit(1)->compose($increment, $times2)->bind($increment)
    ==
    ID::unit(1)->bind($increment)->compose($times2, $increment)
);
