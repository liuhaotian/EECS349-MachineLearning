function SpellCorrect(ToBeSpellCheckedFileName, DictFileName)
	%	read the file
	fin = fopen(ToBeSpellCheckedFileName);
	fin_raw = fscanf(fin, '%c');
	fclose(fin);

	%	read the dict
	fdict = fopen(DictFileName);
	dict = textscan(fdict, '%[^\n]');
	dict = dict{1};
	fclose(fdict);

	%	clean the output	
	fout = fopen('corrected.txt', 'w');
	fprintf(fout, '');
	fclose(fout);

	%	get the output, append mode
	fout = fopen('corrected.txt', 'a');
	%	warning output
	disp(sprintf('Pls note your current dir is %s\n', pwd));
	disp(sprintf('The output file would be %s/corrected.txt\n', pwd));

	oneword = [];
	i = 1;
	while i <= length(fin_raw)
		if double('A') <= double(fin_raw(i)) <= double('Z') || double('a') <= double(fin_raw(i)) <= double('z')
			oneword = [oneword, fin_raw(i)];
		else
			fprintf(fout, '%s', FindCloestWord(oneword, dict));
			oneword = [];
			fprintf(fout, '%c', fin_raw(i));
		end
		i = i + 1;
	end

	%	safely close the output
	fclose(fout);
end