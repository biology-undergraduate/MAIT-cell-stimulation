# MAIT-cell-stimulation
This repo provides the code used to analyse the flow cytometry data generated from PBMC's in which had been stimulated with Interferons. The conditions are Unstimulated, Interferon Alpha, Interferon Gamma and Interferon Lambda. gMFI data was collected using FlowJo and this is the data in which has been analysed using the code within this repository.

An effort has been made to modularise the code by the creation of functions for specific sections. This has cut down on the amount within the source code. However, if this was to be used on a dataset which was not similarly formated (E.G - "CD8.MAIT.cell.gMFI" was named "gMFI") then this code would send and error. Some modification to the functions to improve the abstraction would make this more robust and able to be a more "plug and play" project with many different datasets.

However, For our purposes, the code is made to be able to plug different itterations of our raw dataset in, since this will contain the same formatting throughout.
