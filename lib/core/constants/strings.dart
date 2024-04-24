const String baseUrl =
    "https://testaltenew.myshopify.com/admin/api/2024-04/collections/281542787259";

const String productList = """
  query getCollectionIdFromHandle(\$handle: String!) {
  collectionByHandle(handle: \$handle) {
    id,
    title,
    products(first: 100) {
      edges {
        node {
          id
          title
          description
          status
          variants(first: 1) {
            edges {
              node {
                price
              }
            }
          }
          images(first: 1) {
            edges {
              node {
                originalSrc
              }
            }
          }
        }
      }
    }
  }
}
""";
