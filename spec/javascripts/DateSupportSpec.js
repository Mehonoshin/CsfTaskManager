describe("DateSupport", function() {

	describe("when comparing two dates", function() {		
		it("should be valid if first is greater", function() {
			var smaller = new Date("11.12.2011");
			var greater = new Date("12.12.2011");
			expect(greaterOrEqualThan(greater, smaller)).toEqual(true);
		});
		
		it("should not be valid if second is greater", function() {
			var smaller = new Date("11.12.2011");
			var greater = new Date("12.12.2011");
			expect(greaterOrEqualThan(smaller, greater)).toEqual(false);
		});

		it("should be valid if both are equal", function() {
			var smaller = new Date("12.12.2011");
			var greater = new Date("12.12.2011");
			expect(greaterOrEqualThan(smaller, greater)).toEqual(true);
		});		
	});

	describe("when checking inclusion of date in range", function() {		
		it("should be valid if date is in range", function() {
			var from = new Date("11.12.2011");
			var date = new Date("12.01.2011");
			var to = new Date("12.12.2011");
			expect(dateInRange(date, from, to)).toEqual(true);
		});

		it("should not be valid if date is bigger", function() {
			var from = new Date("11.12.2011");
			var date = new Date("12.13.2011");
			var to = new Date("12.12.2011");
			expect(dateInRange(date, from, to)).toEqual(false);
		});

		it("should not be valid if date is smaller", function() {
			var from = new Date("11.12.2011");
			var date = new Date("11.11.2011");
			var to = new Date("12.12.2011");
			expect(dateInRange(date, from, to)).toEqual(false);
		});
	});

	describe("when getting next monthly date", function() {		
		it("should give correct date", function() {
			var date = new Date("11.12.2011");
			expect(nextMonthlyDate(date)).toEqual(new Date("12.12.2011"));
		});

		// it("should give correct january date", function() {
		// 	var date = new Date("12.12.2011");
		// 	expect(eqlDate(nextMonthlyDate(date), new Date("01.12.2012"))).toEqual(true);
		// });

		// it("should handle 28 and 29 february situation", function() {
		// 	var date = new Date("02.28.2011");
		// 	expect(nextMonthlyDate(date)).toEqual(new Date("01.12.2012"));
		// });
	});
	
	describe("when comparing two dates", function() {		
		it("should be valid if they are equal", function() {
			var from = new Date("12.12.2011");
			var to = new Date("12.12.2011");
			expect(eqlDate(from, to)).toEqual(true);
		});
		
		it("should be valid if they are equal", function() {
			var from = new Date("12.12.2011");
			var to = new Date("13.12.2011");
			expect(eqlDate(from, to)).toEqual(false);
		});		
	});

});