function getResult(deletionCost, insertionCost, substitutionCost)
	%	read the dict
	fdict = fopen('3esl.txt');
	dict = textscan(fdict, '%[^\n]');
	dict = dict{1};
	fclose(fdict);

	%	read typo
	fwiki = fopen('wikipediaclean.txt');
	wiki = textscan(fwiki, '%s\t%s');
	fclose(fwiki);

	errorRate = MeasureError(wiki{1},wiki{2},dict,deletionCost,insertionCost,substitutionCost);

	%	save the result
	fout = fopen('64.txt', 'a');
	fprintf(fout, '%d\t%d\t%d\t%f\n', deletionCost,insertionCost,substitutionCost,errorRate);
	fclose(fout);
end