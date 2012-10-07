function ret = entropy (examples, target_attr)
	examplestrue = examples(find(examples(:,target_attr)>0),:);
	examplesfalse = examples(find(examples(:,target_attr)<1),:);
	pture = length(examplestrue(:,1)) / length(examples(:,1));
	pfalse = length(examplesfalse(:,1)) / length(examples(:,1));
	if isempty(examplestrue) | isempty(examplesfalse)
		ret = 0;
	else	
		ret = - pture * log2(pture) - pfalse * log2(pfalse);
	end
end