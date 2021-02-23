module main

#flag -I @VROOT
#include "magic.h"

fn C.interface_to_struct()

interface Any {}

struct Store {
mut:
	objects map[string]Any
}

fn (s &Store) find<T>(name string) ?&T {
	obj := s.objects[name] or { return none }
	return unsafe { &T(C.interface_to_struct(&obj)) }
}

fn (mut s Store) add(name string, v Any) {
	s.objects[name] = v
}

struct Foo {
	f1 int
	f2 string
}

struct Bar {
	f1 string
	f2 f64
	f3 bool
}

mut store := &Store{}
store.add('foo', Foo{42, 'foo'})
store.add('bar', Bar{'bar', 3.14, true})

foo := store.find<Foo>('foo') ?
println(foo)
bar := store.find<Bar>('bar') ?
println(bar)

// !!! DANGER ZONE !!!
/*
foo_as_bar := store.find<Bar>('foo') ?
println(foo_as_bar)
bar_as_foo := store.find<Foo>('bar') ?
println(bar_as_foo)
*/
