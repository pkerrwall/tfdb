#!/usr/bin/perl -w

use strict;

=item
print "Family\tGene Symbol\tGene Name\tAlso Known As\tSource Material for Membership\n";
my $fam_name = "";
open IN, "< FBgg0000745_gene_group_transfac.html.txt";
while (<IN>){
	chomp;
	my $line = $_;
	my @a=split(/\t/,$line);
	if (@a == 4){
		print "$fam_name\t" . join("\t", @a) . "\n" unless ($line =~ /^Gene Symbol/);
	} else {
		$fam_name = $a[0];
	}
}
close IN;
exit;
=cut


# nothing
# <a class="html-attribute-value html-external-link" target="_blank" href="https://flybase.org/reports/
#print "Family\tGene Symbol\tGene Name\tAlso Known As\tSource Material for Membership\n";
my $fam_name = "";
#open IN, "< FBgg0000745_gene_group_transfac.html";
my $html = `cat FBgg0000745_gene_group_transfac.html`;
my @a = split(/<a class="html-attribute-value html-external-link" target="_blank" href="https:\/\/flybase.org\/reports\/FBgn/, $html);
foreach my $gene (@a){
	print "$gene\n\n\n";
}
exit;

