describe("user can visit products page from home", () => {
	it("root path visits the home page", () => {
		cy.visit("/");
	});
	it("There is products on the page", () => {
		cy.get(".products article").should("be.visible");
	});
	it("There is 2 products on the page", () => {
		cy.get(".products article").should("have.length", 2);
	});
	it("visits the product page when clicking on the product", () => {
		cy.get(".products article a").first().click();
		cy.get(".product-detail").should("contain", "Scented Blade");
	});
});
