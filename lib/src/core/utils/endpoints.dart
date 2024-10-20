String categoryUrl(int page, int limit) => "categories?limit=$limit&page=$page";
String searchCategoryUrl(categoryName) =>
    "category/search?category=$categoryName";
String detailCategoryUrl(categoryId) => "words/$categoryId";
