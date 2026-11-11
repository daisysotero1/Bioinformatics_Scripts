#!/bin/bash

# Input FASTA file containing protein sequences for phylogenetic analysis
input="Fatty_Acid_Desaturase.fasta"

####### 1. SEQUENCE ALIGNMENT #######
####### 1. SEQUENCE ALIGNMENT #######

mkdir -p 1-alignment

threads=75

# MAFFT local alignment
mafft --localpair --maxiterate 1000 --thread $threads "$input" > 1-alignment/aln.mafft.local.fasta

# MAFFT global alignment
mafft --globalpair --maxiterate 1000 --thread $threads "$input" > 1-alignment/aln.mafft.global.fasta

# ClustalW global alignment
clustalw -INFILE="$input" -OUTFILE=1-alignment/aln.clustal_global.fasta -OUTPUT=FASTA


####### 2. ALIGNMENT TRIMMING #######
####### 2. ALIGNMENT TRIMMING #######

aln_mafft_local='1-alignment/aln.mafft.local.fasta'
aln_mafft_global='1-alignment/aln.mafft.global.fasta'
aln_clustal_global='1-alignment/aln.clustal_global.fasta'

mkdir -p 2-trimming_trimal/{mafft_local,mafft_global,clustal_global}

# MAFFT local alignment

trimal -nogaps -in $aln_mafft_local -fasta \
       -out 2-trimming_trimal/mafft_local/aln_trim_nogaps_mafft_local.fasta \
       -htmlout 2-trimming_trimal/mafft_local/nogaps_mafft_local.html

trimal -nogaps -in $aln_mafft_local -nexus \
       -out 2-trimming_trimal/mafft_local/nogaps_mafft_local.nex

trimal -nogaps -in $aln_mafft_local -mega \
       -out 2-trimming_trimal/mafft_local/nogaps_mafft_local.meg

trimal -automated1 -in $aln_mafft_local -fasta \
       -out 2-trimming_trimal/mafft_local/aln_trim_automated1_mafft_local.fasta \
       -htmlout 2-trimming_trimal/mafft_local/automated1_mafft_local.html

trimal -automated1 -in $aln_mafft_local -nexus \
       -out 2-trimming_trimal/mafft_local/automated1_mafft_local.nex

trimal -automated1 -in $aln_mafft_local -mega \
       -out 2-trimming_trimal/mafft_local/automated1_mafft_local.meg

trimal -gappyout -in $aln_mafft_local -fasta \
       -out 2-trimming_trimal/mafft_local/aln_trim_gappyout_mafft_local.fasta \
       -htmlout 2-trimming_trimal/mafft_local/gappyout_mafft_local.html

trimal -gappyout -in $aln_mafft_local -nexus \
       -out 2-trimming_trimal/mafft_local/gappyout_mafft_local.nex

trimal -gappyout -in $aln_mafft_local -mega \
       -out 2-trimming_trimal/mafft_local/gappyout_mafft_local.meg


# MAFFT global alignment

trimal -nogaps -in $aln_mafft_global -fasta \
       -out 2-trimming_trimal/mafft_global/aln_trim_nogaps_mafft_global.fasta \
       -htmlout 2-trimming_trimal/mafft_global/nogaps_mafft_global.html

trimal -nogaps -in $aln_mafft_global -nexus \
       -out 2-trimming_trimal/mafft_global/nogaps_mafft_global.nex

trimal -nogaps -in $aln_mafft_global -mega \
       -out 2-trimming_trimal/mafft_global/nogaps_mafft_global.meg

trimal -automated1 -in $aln_mafft_global -fasta \
       -out 2-trimming_trimal/mafft_global/aln_trim_automated1_mafft_global.fasta \
       -htmlout 2-trimming_trimal/mafft_global/automated1_mafft_global.html

trimal -automated1 -in $aln_mafft_global -nexus \
       -out 2-trimming_trimal/mafft_global/automated1_mafft_global.nex

trimal -automated1 -in $aln_mafft_global -mega \
       -out 2-trimming_trimal/mafft_global/automated1_mafft_global.meg

trimal -gappyout -in $aln_mafft_global -fasta \
       -out 2-trimming_trimal/mafft_global/aln_trim_gappyout_mafft_global.fasta \
       -htmlout 2-trimming_trimal/mafft_global/gappyout_mafft_global.html

trimal -gappyout -in $aln_mafft_global -nexus \
       -out 2-trimming_trimal/mafft_global/gappyout_mafft_global.nex

trimal -gappyout -in $aln_mafft_global -mega \
       -out 2-trimming_trimal/mafft_global/gappyout_mafft_global.meg


# ClustalW global alignment

trimal -nogaps -in $aln_clustal_global -fasta \
       -out 2-trimming_trimal/clustal_global/aln_trim_nogaps_clustal_global.fasta \
       -htmlout 2-trimming_trimal/clustal_global/nogaps_clustal_global.html

trimal -nogaps -in $aln_clustal_global -nexus \
       -out 2-trimming_trimal/clustal_global/nogaps_clustal_global.nex

trimal -nogaps -in $aln_clustal_global -mega \
       -out 2-trimming_trimal/clustal_global/nogaps_clustal_global.meg

trimal -automated1 -in $aln_clustal_global -fasta \
       -out 2-trimming_trimal/clustal_global/aln_trim_automated1_clustal_global.fasta \
       -htmlout 2-trimming_trimal/clustal_global/automated1_clustal_global.html

trimal -automated1 -in $aln_clustal_global -nexus \
       -out 2-trimming_trimal/clustal_global/automated1_clustal_global.nex

trimal -automated1 -in $aln_clustal_global -mega \
       -out 2-trimming_trimal/clustal_global/automated1_clustal_global.meg

trimal -gappyout -in $aln_clustal_global -fasta \
       -out 2-trimming_trimal/clustal_global/aln_trim_gappyout_clustal_global.fasta \
       -htmlout 2-trimming_trimal/clustal_global/gappyout_clustal_global.html

trimal -gappyout -in $aln_clustal_global -nexus \
       -out 2-trimming_trimal/clustal_global/gappyout_clustal_global.nex

trimal -gappyout -in $aln_clustal_global -mega \
       -out 2-trimming_trimal/clustal_global/gappyout_clustal_global.meg


####### NOTE: CHECK FOR SUBSTITUTION SATURATION #######
####### For nucleotide sequences, for exemple DAMBE #######


####### 3. SUBSTITUTION MODEL SELECTION - ModelTest-NG #######
####### 3. SUBSTITUTION MODEL SELECTION - ModelTest-NG #######

best_trimmed_alignment=$(python3 best_trim.py)

model_output_dir='3-substitution_model'
model_prefix='modeltest-ng'

mkdir -p $model_output_dir

cp $best_trimmed_alignment $model_output_dir

modeltest-ng -i $best_trimmed_alignment -d aa -p $threads -T mrbayes \
             -o $model_output_dir/$model_prefix

best_model=$(grep -A 10 "Best model according to BIC" $model_output_dir/$model_prefix.out | grep "Model:" | awk '{print $2}')

echo "Selected model: $best_model"


####### 4. PHYLOGENETIC ANALYSIS - MAXIMUM LIKELIHOOD (ML) #######
####### 4. PHYLOGENETIC ANALYSIS - MAXIMUM LIKELIHOOD (ML) #######

ml_dir='4-ML_analysis'

mkdir -p $ml_dir

cp $best_trimmed_alignment $ml_dir

cd $ml_dir

alignment_file=$(basename "$best_trimmed_alignment")

consensus_type='MR50'


# Calculate the maximum likelihood tree
raxml-ng --threads $threads --msa $alignment_file --model $best_model --prefix BT

# Perform bootstrap analysis
raxml-ng --threads $threads --msa $alignment_file --model $best_model --bootstrap --bs-trees 1000 --prefix BS

# Calculate the bootstrap consensus tree (majority-rule 50% / MR50)
raxml-ng --threads $threads --msa $alignment_file --model $best_model --tree BS.raxml.bootstraps \
         --consense $consensus_type --prefix ML_tree

# Transfer bootstrap support values to the best ML tree (without consensus tree condensation)
raxml-ng --support --tree BT.raxml.bestTree --bs-trees BS.raxml.bootstraps --prefix BT_tree