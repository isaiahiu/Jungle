describe("testing add to cart feature", () => {
	it("visits the home page", () => {
		cy.visit("/");
	});
	it("There is products on the page", () => {
		cy.get(".products article").should("be.visible");
	});
	it("should add to the cart number when Add to Cart button clicked", () => {
		// cy.get(".end-0 a").then($cart => {
		// 	const size = $cart.text();
		// 	expect(size).to.have.string("My Cart (0)");

		// 	cy.get(":nth-child(1) > div > .button_to > .btn")
		// 		.click({ force: true })
		// 		.then(() => {
		// 			cy.get(".end-0 a").then($newCart => {
		// 				const newSize = $newCart.text();

		// 				expect(size).to.not.eq(newSize);
		// 				expect(newSize).to.have.string("My Cart (1)");
		// 			});
		// 		});
		// });
		cy.get(".end-0 a").should("have.text", " \n          My Cart (0) ");
		cy.get(".btn").contains("Add").first().click({ force: true });
		cy.get(".end-0 a").should("have.text", " \n          My Cart (1) ");
	});
});
