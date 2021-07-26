module.exports = (label) => {
  return {
    type: 'item',
    labels: {
      en: label,
      lt: label
    },
    claims: {
      P31: { value: 'Q5' }, // human
      P106: { value: 'Q82955' }, // politician
      P39: {
        value: 'Q18390049',
        qualifiers: {
          P2937: 'Q107651615'
        },
        references: {
          P854: 'http://www.parlament.md/StructuraParlamentului/Deputa%C8%9Bii/tabid/87/language/en-US/Default.aspx'
        },
      }
    }
  }
}
