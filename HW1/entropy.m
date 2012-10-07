function ret = entropy (examples, target_attr)
	examplestrue = examples(find(examples(:,target_attr)>0),:);
	examplesfalse = examples(find(examples(:,target_attr)<1),:);
	pture = length(examplestrue) / length(examples);
	pfalse = length(examplesfalse) / length(examples);
	if isempty(examplestrue) | isempty(examplesfalse)
		ret = 0;
	else	
		ret = - pture * log2(pture) - pfalse * log2(pfalse);
	end
end