# GraFT-analysis

GraFT (Graph-Filtered Temporal) dictionaty learning is a signal extraction method for spatio-temporal data. GraFT uses a diffusion map to learn a graph over spatial pixels that enables for stochastic filtering of learned sparse representations over each pixel's time-trace. The sparse representaions are modeled as in a heirarchical dictionary learning framework with correlated decompositions over the graph. 

# Use case

GraFT can be applied to any 3D tensor dataset where each vector at each position in the first two 'ways' can be decomposed as a sparse sum and the decomposition can be correlated along complex spatial morphologies. The main use case we present is to calcium imaging data, where data at different zoom levels can have highly varying spatial statistics, yet similar temporal sparse decompositions. Please see the demo file for an example on how to use the main function.

# Implementation notes

GraFT is implemented in MATLAB, and at its core uses a sparse decomposition (re-weighted l1-optimization) over every pixel. This step is embarresingly parallel and so using a parallel pool is highly encouraged to increase runtime. Moreover we provide a patch-based version of GraFT that splits the full field-of-view into smaller, overlapping sections. Each patch is independently analyzed and the results are merged for a full decomposition of the data. 

# Manuscript

The details of GraFT are described in:

A.S. Charles, N. Cermak, R. Affan, B. Scott, J. Schiller & G. Mishne. GraFT: Graph Filtered Temporal Dictionary Learning for Functional Neural Imaging.
