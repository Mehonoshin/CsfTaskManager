function greaterOrEqualThan(greater, small) {
  if (greater.getFullYear() == small.getFullYear()) {
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
	return greater.getFullYear() > small.getFullYear();
  }
}

function dateInRange(date, from, to) {
  if (date.getFullYear() == from.getFullYear() && date.getFullYear() == to.getFullYear()) {
	if (date.getMonth() == from.getMonth() && date.getMonth() == to.getMonth()) {
	  if (date.getDate() == from.getDate() && date.getDate() == to.getDate()) {
		return true;
  	  } else {
	    return (date.getDate() >= from.getDate() && date.getDate() <= to.getDate());
      }
	} else {
	  return ((date.getMonth() > from.getMonth() && date.getDate() <= to.getDate()) || (date.getDate() >= from.getDate() && date.getMonth() < to.getMonth()));
	}
  } else {
	return (date.getFullYear() >= from.getFullYear() && date.getFullYear() <= to.getFullYear());
  }
}

function nextMonthlyDate(date) {
	day = date.getDate();	
	today = new Date();
	currentMonth = today.getMonth();
	month = currentMonth;
	if (currentMonth == 12) {
      month = 1;	
	} else {
      month++;
	}
	currentYear = date.getFullYear();
	if (currentMonth == 12 && today.getDate() == 31) {
	  currentYear++;
	}	
	nextDate = new Date(month + "." + day + "." + currentYear);
	return nextDate;
}

function eqlDate(one, two) {
  return ((one.getFullYear() == two.getFullYear()) && (one.getMonth() == two.getMonth()) && (one.getDate() == two.getDate()));
}