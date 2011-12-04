function greaterThan(greater, small) {
  if (greater.getYear() > small.getYear()) {
	if (greater.getMonth() > small.getMonth()) {
      if (greater.getDate() > small.getDate()) {
	    return true;
      } else {
	    return false;	
      }
	}
    else {
      return false;	
    }
  } else {
    return false;	
  }
}

function greaterOrEqualThan(greater, small) {
  if (greater.getYear() >= small.getYear()) {
	if (greater.getMonth() >= small.getMonth()) {
      if (greater.getDate() >= small.getDate()) {
	    return true;
      } else {
	    return false;	
      }
	}
    else {
      return false;	
    }
  } else {
    return false;	
  }
}
