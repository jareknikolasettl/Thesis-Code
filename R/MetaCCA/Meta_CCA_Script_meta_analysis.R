start_time = Sys.time()

library(metaCCA)

setwd('/Volumes/Google Drive/My Drive/PROJECT/Data/Aging Biomarkers/European/Jupyter Exports/Meta Analysis')

# Edit the file path
S_XY_full_1 = read.csv('FULL/META_S_XY_full0.csv',row.names=1)
S_XY_filtered_1 = read.csv('0.5/META_S_XY_filtered0.csv',row.names=1)

setwd('/Volumes/Google Drive/My Drive/PROJECT/Data/Aging Biomarkers/African/Jupyter Exports/Meta Analysis')

# Edit the file path
S_XY_full_2 = read.csv('FULL/META_S_XY_full0.csv',row.names=1)
S_XY_filtered_2 = read.csv('0.5/META_S_XY_filtered0.csv',row.names=1)

levels(S_XY_full_1[,1]) = levels(S_XY_full_study1[,1])
levels(S_XY_full_1[,2]) = levels(S_XY_full_study1[,2])

levels(S_XY_full_2[,1]) = levels(S_XY_full_study2[,1])
levels(S_XY_full_2[,2]) = levels(S_XY_full_study2[,2])

levels(S_XY_filtered_1[,1]) = levels(S_XY_full_study1[,1])
levels(S_XY_filtered_1[,2]) = levels(S_XY_full_study1[,2])

levels(S_XY_filtered_2[,1]) = levels(S_XY_full_study2[,1])
levels(S_XY_filtered_2[,2]) = levels(S_XY_full_study2[,2])

S_YY_E_1 = estimateSyy(S_XY_full_1)
S_YY_E_2 = estimateSyy(S_XY_full_2)


N1 = lengths(S_XY_full_1['allele_0'], use.names=FALSE)
N2 = lengths(S_XY_full_2['allele_0'], use.names=FALSE)


metaCCA_res1 = metaCcaGp( nr_studies = 2,
							S_XY = list(S_XY_filtered_1, S_XY_filtered_2),
							std_info = c(0,0),
							S_YY = list(S_YY_E_1, S_YY_E_2),
							N = c(N1, N2) )
							
print(head(metaCCA_res1[1:2]), digits = 2)

end_time = Sys.time()

end_time - start_time

lengths(S_XY_filtered_1['allele_0'], use.names=FALSE)

N1

# Edit the results directory
setwd('/Volumes/Google Drive/My Drive/PROJECT/Data/Aging Biomarkers/Meta Analysis Results/0.5')

# Edit the file name
write.csv(metaCCA_res1[1:2],'0.5_Meta_Results_Chrom_1.csv')