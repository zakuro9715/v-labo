module linked_list

import x.json2

// TODO: wait generic implementation

pub struct Element {
mut:
	value voidptr
	list  &List
	next  &Element = 0
	prev  &Element = 0
}

fn (e &Element) to_opt() ?Element {
	if isnil(e) {
		return none
	}
	return *e
}

pub fn (e &Element) next() ?Element {
	return e.next.to_opt()
}

pub fn (e &Element) prev() ?Element {
	return e.prev.to_opt()
}

pub fn (e &Element) value<T>() T {
	return *(&T(e.value))
}

pub struct List {
mut:
	first &Element = 0
	last  &Element = 0
	len   int
}

pub fn (list &List) first() &Element {
	return list.first
}

pub fn (list &List) last() &Element {
	return list.last
}

pub fn (list &List) len() int {
	return list.len
}

pub fn (mut list List) push<T>(v &T) {
	mut elem := &Element{
		value: voidptr(v)
		list: list
	}
	if isnil(list.first) {
		list.first = elem
	}
	if !isnil(list.last) {
		list.last.next = elem
		elem.prev = list.last
	}
	list.last = elem
	list.len++
}

pub fn (mut list List) prepend<T>(v &T) {
	mut elem := &Element{
		value: voidptr(v)
		list: list
	}
	if isnil(list.last) {
		list.last = elem
	}
	if !isnil(list.first) {
		list.first.prev = elem
		elem.next = list.first
	}
	list.first = elem
	list.len++
}
