#!/bin/bash --login
#SBATCH --time=168:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=100GB
#SBATCH --job-name example
#SBATCH --output=%x-%j.SLURMout

#Change to current working directory
cd ${PBS_O_WORKDIR}

#Add conda environment to the path
export PATH="${HOME}/miniconda3/envs/plb812/bin:${PATH}"
export LD_LIBRARY_PATH="${HOME}/miniconda3/envs/plb812/lib:${LD_LIBRARY_PATH}"

#List of sra files we want to download.
#The list is separated by single spaces.
sra_list="SRR401413 SRR401414 SRR401415"

#Use a for loop to go over each file and download it.
for sra in ${sra_list}
do
	#Use prefetch from the SRA toolkit to get the SRA file
	prefetch --max-size 100000000 ${sra}
	#Prefetch will download the SRA file into a directory of the same name.
	#We will move the file out into our current working directory and remove
	#the empty directory
	mv ${sra}/*sra ./
	rmdir ${sra}

	#Use fastq-dump to convert the SRA format to a gzipped fastq format
	fastq-dump --gzip --split-3 ${sra}.sra
done


