function ret = gain (examples, attr, target_attr)
	examplestrue = examples(find(examples(:,attr)>0),:);
	examplesfalse = examples(find(examples(:,attr)<1),:);
	pture = length(examplestrue) / length(examples);
	pfalse = length(examplesfalse) / length(examples);
	ret = entropy(examples, target_attr) - pture * entropy(examplestrue, target_attr) - pfalse * entropy(examplesfalse, target_attr);
end