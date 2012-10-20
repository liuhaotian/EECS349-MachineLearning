function getResultNFold(N, nth, deletionCost, insertionCost, substitutionCost)
	%	read the dict
	fdict = fopen('3esl.txt');
	dict = textscan(fdict, '%[^\n]');
	dict = dict{1};
	fclose(fdict);

	%	read typo
	fwiki = fopen('wikipediatypo.txt');
	wiki = textscan(fwiki, '%s\t%[^\n]');
	fclose(fwiki);

	%	n fold index
	fold = {};
	wiki_size = length(wiki{1});
	for i=1:N
		fold{i} = i:N:wiki_size;
	end

	errorRate = MeasureError(wiki{1}(fold{nth}),wiki{2}(fold{nth}),dict,deletionCost,insertionCost,substitutionCost);

	%	save the result
	filename = sprintf('%d%d%d.txt', deletionCost,insertionCost,substitutionCost);
	fout = fopen(filename, 'a');
	fprintf(fout, '%d\t%f\n', nth, errorRate);
	fclose(fout);
end