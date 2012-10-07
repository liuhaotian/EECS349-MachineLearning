function ret = gain (examples, attr, target_attr)
	examplestrue = examples(find(examples(:,attr)>0),:);
	examplesfalse = examples(find(examples(:,attr)<1),:);
	pture = length(examplestrue(:,1)) / length(examples(:,1));
	pfalse = length(examplesfalse(:,1)) / length(examples(:,1));
	ret = entropy(examples, target_attr) - pture * entropy(examplestrue, target_attr) - pfalse * entropy(examplesfalse, target_attr);
end