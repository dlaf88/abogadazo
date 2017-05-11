Trix.config.textAttributes.subHeading = { inheritable: true, tagName: 'h2' };
buttonHTML = "<button type=\"button\" class=\"h2\" data-trix-attribute=\"subHeading\" title=\"heading1\">heading1</button>";
groupElement = Trix.config.toolbar.content.querySelector(".block_tools");
groupElement.insertAdjacentHTML("beforeend", buttonHTML);