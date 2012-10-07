function ret = entropy (examples, attribute)
	examplestrue = examples(find(examples(:,attribute)>0),:);
	examplesfalse = examples(find(examples(:,attribute)<1),:);
	pture = length(examplestrue) / length(examples);
	pfalse = length(examplesfalse) / length(examples);
	ret = - pture * log2(pture) - pfalse * log2(pfalse);
end