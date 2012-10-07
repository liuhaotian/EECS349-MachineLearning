function root = id3 (examples, attributes, target_attr)
	root = treenode;
	if sum(examples(:,target_attr) > 0)
		root.label = 1;
	elseif sum(examples(:,target_attr) < 1)
		root.label = 0;
	elseif isempty(attributes)
		root.label = sum(examples(:,target_attr) > 0) > sum(examples(:,target_attr) < 1);
	else
		root.attr = best(examples, attributes, target_attr);

		newattributes = attributes;
		newattributes(find(attributes == root.attr)) = [];

		examplestrue = examples(find(examples(:,root.attr)>0),:);
		if isempty(examplestrue)
			tempnode = treenode;
			tempnode.label = sum(examples(:,target_attr) > 0) > sum(examples(:,target_attr) < 1);
			root.childture = tempnode;
		else
			root.childture = id3(examplestrue, newattributes, target_attr);
		end
		
		examplesfalse = examples(find(examples(:,root.attr)<1),:);
		if isempty(examplesfalse)
			tempnode = treenode;
			tempnode.label = sum(examples(:,target_attr) > 0) > sum(examples(:,target_attr) < 1);
			root.childfalse = tempnode;
		else
			root.childfalse = id3(examplesfalse, newattributes, target_attr);
		end
	end
end
		
		