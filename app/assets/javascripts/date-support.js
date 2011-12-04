function greaterOrEqualThan(greater, small) {
  if (greater.getYear() == small.getYear()) {
	if (greater.getMonth() == small.getMonth()) {
	  if (greater.getDate() == small.getDate()) {
		return true;
  	  } else {
	    return greater.getDate() > small.getDate();
      }
	} else {
	  return greater.getMonth() > small.getMonth();
	}
  } else {
	return greater.getYear() > small.getYear();
  }
}

function dateInRange(date, from, to) {
  if (date.getYear() == from.getYear() && date.getYear() == to.getYear()) {
	if (date.getMonth() == from.getMonth() && date.getMonth() == to.getMonth()) {
	  if (date.getDate() == from.getDate() && date.getDate() == to.getDate()) {
		return true;
  	  } else {
	    return (date.getDate() >= from.getDate() && date.getDate() <= to.getDate());
      }
	} else {
	  return (date.getMonth() >= from.getMonth() && date.getMonth() <= to.getMonth());
	}
  } else {
	return (date.getYear() >= from.getYear() && date.getYear() <= to.getYear());
  }
}