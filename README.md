# zotero2ncbi

Format **Zotero** References Exported as CSV into **NCBI Batch Citation Matcher**

This process was required by the American Journal of Ophthalmology to verify references with PubMed before submitting the manuscript. 
It was impossible to find a simple way to do this, so this is a crude attempt to automate an otherwise mundane task.


# Zotero

Create list of references in [Zotero Reference Manager](https://www.zotero.org/).

Highlight references, right click, **Export items...** with **Format: CSV**. 


# R Script

Run R script, selecting .CSV file exported from Zotero


# NCBI Batch Citation Manager

Import processed .CSV fie into [NCBI Batch Citation Manager](https://www.ncbi.nlm.nih.gov/pubmed/batchcitmatch)
