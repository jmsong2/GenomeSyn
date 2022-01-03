# GenomeSyn
We developed GenomeSyn as a new tool for constructing and visualizing genome synteny, its novel design and implementation can serve as a necessary complement to the study of genomic synteny and structural variation and its visualization tools.

## Install

Simple click to GenomeSyn(Perl)/GenomeSyn(Python). They are executable files, you can run it directly.
GenomeSyn is open source,so you can download the source code and modify the appropriate source code to suit their needs. (Perl/Python)
If you use the GenomeSyn, you need to solve the software dependency problem first.
You can download example data to test .
## Dependencies 
1. MUMmer 
You can find MUMmer [HERE](https://github.com/mummer4/mummer/releases). We used Mummer-4.0.0beta2. Mummer version 4.x.x requires a recent version of the GCC compiler (g++ version >= 4.7), which is hard to install if you have no ***administrator authority***. You can ask your system administrator for some help in this case. 

```
$ wget https://github.com/mummer4/mummer/releases/download/v4.0.0beta2/mummer-4.0.0beta2.tar.gz 
$ tar -xvzf mummer-4.0.0beta2.tar.gz 
$ cd mummer-4.0.0beta2 
$ ./configure --prefix=`pwd` 
$ make 
# Add MUMmer tools to your PATH 
$ export PATH=/your_path/GenomeSyn/mummer-4.0.0beta2:$PATH 
```

2. Perl and perl module we recommend that the version of perl should be at least 5.10.0 (use perl -v to check the version). Although most of the GenomeSyn modules used already exist, you may still need to install the SVG module and the BioPerl module. Due to the lack of administrator rights, it is sometimes troublesome to install perl modules under Linux systems. This page introduces two installations of the [SVG](https://cpan.metacpan.org/authors/id/M/MA/MANWAR/SVG-2.85.tar.gz "SVG") module and three installations [BioPerl] (https://cpan.metacpan.org/authors/id/C/CJ/CJFIELDS/BioPerl-1.7.8.tar.gz "BioPerl") module method, but in fact cpanm is the most friendly installation perl module method. You can find the pre-compiled source code of cpanm here [page](https://bioperl.org/INSTALL.html). There are SVG and BioPerl compressed packages in our GenomeSyn, which can be installed and used after decompression. 

### install SVG 
```
$ cpanm SVG 
```
#Unzip and install SVG 
```
$ tar -zxvf SVG-2.85.tar.gz 
$ cd SVG-2.85/ 
$ perl Makefile.PL 
$ make 
$ make test 
### Add SVG to your PATH
$ PERL5LIB=/your_path/GenomeSyn/SVG-2.85/lib:$PERL5LIB 
```
### install BioPerl 
```
$ cpanm Bio::SeqIO 
```
### Unzip and install BioPerl 
```
$ tar -zxvf BioPerl-1.7.8.tar.gz 
$ cd BioPerl-1.7.8/ 
$ perl Makefile.PL 
$ make 
$ make test 
```
### Add Perl module to your PATH 
```
$ PERL5LIB=/your_path/GenomeSyn/BioPerl-1.7.8/lib:$PERL5LIB 
```
3. Python and python module 

Here we need to use python's svglib package to convert the output SVG file into a PDF file. 
Install [Python] (https://www.python.org/ftp/python/3.9.4/Python-3.9.4.tgz "Python") and svglib[svglib] (https://files.pythonhosted.org/ packages/c0/2c/5ab28095c9ce09a6d341cb37c0ad3a7ffc65e5c5f2eaa2247c085679ca2f/svglib-1.1.0.tar.gz "svglib") package can refer to the following: 
```
$ tar -zxvf Python-3.9.4.tgz -C ./ 
$ cd ./Python-3.9.4 
$./configure --prefix=$current_path/Python-3.9.4/localpython 
$ make 
$ make install 
$ Add Python to your PATH 
$ PATH=/your_path/GenomeSyn/Python-3.9.4/python:$PATH 
$ tar -zxvf svglib-1.1.0.tar.gz -C ./ 
$ cd svglib-1.1.0/ 
$ /your_path/GenomeSyn/Python-3.9.4/python setup.py install 
```
There is an install.sh script in our GenomeSyn package. Running this shell script can help us install the required modules (SVG, BioPerl, Python and svglib of python module) and add environment variables for the corresponding modules. After running this shell script, reload the environment variables to run.

# Quick start

	eg. GenomeSyn -g1 ../data/rice_MH63.fa -g2 ../data/rice_ZS97.fa

	eg. GenomeSyn -t 3 -g1 ../data/rice_MH63.fa -g2 ../data/rice_ZS97.fa -cf1
		../data/rice_MH63vsZS97.delta.filter.coords

	eg. GenomeSyn -t 3 -g1 ../data/rice_MH63.fa -g2 ../data/rice_ZS97.fa -cf1
	../data/rice_MH63vsZS97.delta.filter.coords -cen1
	../data/rice_MH63_centromere.bed -cen2 ../data/rice_ZS97_centromere.bed
	-tel1 ../data/rice_MH63_telomere.bed -tel2 ../data/rice_ZS97_telomere.bed
	-TE1 ../data/rice_MH63_repeat.bed -TE2 ../data/rice_ZS97_repeat.bed -PAV1
	../data/rice_MH63_PAV.bed -PAV2 ../data/rice_ZS97_PAV.bed -NLR1
	../data/rice_MH63_NLR.bed -NLR2 ../data/rice_ZS97_NLR.bed -r MH63 -q ZS97
	-GD1 ../data/rice_MH63_nonTEgene.gff3 -GD2
	../data/rice_ZS97_nonTEgene.gff3 -GC1 ../data/rice_MH63_GC_10000.bed -GC2
	../data/rice_ZS97_GC_10000.bed -GC_win 100000 -TE_min 40

	eg. GenomeSyn -t 3 -n3 12 -g1 ../data/rice_MH63.fa -g2
	../data/rice_ZS97.fa -g3 ../data/rice_R498.fasta -cf1
	../data/rice_MH63vsZS97.delta.filter.coords -cf2
	../data/rice_MH63vsR498.delta.filter.coords -cen1
	../data/rice_MH63_centromere.bed -cen2 ../data/rice_ZS97_centromere.bed
	-cen3 ../data/rice_R498_centromere.bed -tel1
	../data/rice_MH63_telomere.bed -tel2 ../data/rice_ZS97_telomere.bed -tel3
	../data/rice_R498_telomere.bed -TE2 ../data/rice_ZS97_repeat.bed -PAV1
	../data/rice_MH63_PAV.bed -PAV2 ../data/rice_ZS97_PAV.bed -NLR1
	../data/rice_MH63_NLR.bed -NLR2 ../data/rice_ZS97_NLR.bed -r MH63 -q1 ZS97
	-q2 R498 -GD1 ../data/rice_MH63_nonTEgene.gff3 -GD2
	../data/rice_ZS97_nonTEgene.gff3 -GD3 ../data/rice_R498_IGDBv3_coreset.gff
	-GC2 ../data/rice_ZS97_GC_10000.bed -GC_win 100000 -TE_min 40
