module.exports = id => ({
  id,
  claims: {
    P39: {
      value: 'Q18390049',
      qualifiers: {
        P2937: 'Q107651615'
      },
      references: {
        P854: 'http://www.parlament.md/StructuraParlamentului/Deputa%C8%9Bii/tabid/87/language/en-US/Default.aspx',
        P1476: {
          text: 'Members of the Parliament',
          language: 'en',
        },
        P813: new Date().toISOString().split('T')[0],
        P407: 'Q1860', // language: English
      },
    }
  }
})
