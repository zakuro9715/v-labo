module linked_list

fn test_linked_list() {
	mut list := &List{}

	assert list.len() == 0
	assert isnil(list.first())
	assert isnil(list.last())

	list.push('1')
	assert list.len() == 1
	assert list.first().value<string>() == '1'
	if _ := list.first().next() {
		assert false
	}
	if _ := list.first().prev() {
		assert false
	}
	assert list.first().value<string>() == '1'
	if _ := list.last().next() {
		assert false
	}
	if _ := list.last().prev() {
		assert false
	}

	list.push('2')
	assert list.len() == 2
	assert list.first().value<string>() == '1'
	if v := list.first().next() {
		assert v.value<string>() == '2'
	} else {
		assert false
	}
	if _ := list.first().prev() {
		assert false
	}
	assert list.last().value<string>() == '2'
	if _ := list.last().next() {
		assert false
	}
	if v := list.last().prev() {
		assert v.value<string>() == '1'
	}

	list.prepend('0')
	assert list.len() == 3
	assert list.first().value<string>() == '0'
	if v := list.first().next() {
		assert v.value<string>() == '1'
	} else {
		assert false
	}
	if _ := list.first().prev() {
		assert false
	}
	assert list.last().value<string>() == '2'
	if _ := list.last().next() {
		assert false
	}
	if v := list.last().prev() {
		assert v.value<string>() == '1'
	}
}
