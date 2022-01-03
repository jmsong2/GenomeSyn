#!/bin/bash
##1.MUMmer
current_path=`pwd`
tar -zxvf mummer-4.0.0beta2.tar.gz
cd mummer-4.0.0beta2
./configure --prefix=`pwd`
make
# Add MUMmer tools to your PATH
mummer_path="export PATH=$current_path/mummer-4.0.0beta2:\$PATH"
echo $mummer_path >> ~/.bashrc
##2.SVG of Perl module
cd $current_path
tar -zxvf SVG-2.85.tar.gz
cd SVG-2.85/
perl Makefile.PL
make
make test
##3.BioPerl of Perl module
cd $current_path
tar -zxvf BioPerl-1.7.8.tar.gz
cd BioPerl-1.7.8/
perl Makefile.PL
make
make test
# Add Perl module to your PATH
perl_path="export PERL5LIB=$current_path/SVG-2.85/lib:$current_path/BioPerl-1.7.8/lib:\$PERL5LIB"
echo $perl_path >> ~/.bashrc
##4.Python and python module
cd $current_path
tar -zxvf Python-3.9.4.tgz -C ./
cd ./Python-3.9.4
./configure --prefix=$current_path/Python-3.9.4/localpython
make
make install
#Add Python to your PATH
python_path="export PATH=$current_path/Python-3.9.4/python:\$PATH"
echo $python_path >> ~/.bashrc
##4.1 svglib of python module
cd $current_path
tar -zxvf svglib-1.1.0.tar.gz -C ./
cd svglib-1.1.0/
$current_path/Python-3.9.4/python setup.py install
#Add GenomeSyn to your PATH
genomesyn_path="export PATH=$current_path/bin:\$PATH"
echo $genomesyn_path >> ~/.bashrc
