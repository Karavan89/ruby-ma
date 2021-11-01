hash = {
    1    => 2,
    nil  => 3,
    'kEy' => :value_1,
    :key  => :value_2,
    Key:    :value_3
}

count = hash.keys.grep(/([k]|[K])([e]|[E])([y]|[Y])/).count

print "Кількість ключив хеша з назвою key без урахування його типу та реєстру: #{count}"