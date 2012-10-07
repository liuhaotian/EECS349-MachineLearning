function ret = classify (root, onecase)
	if root.label == 1
		ret = 1;
	elseif root.label == 0
		ret = 0;
	else
		if onecase(root.attr) == 1;
			ret = classify(root.childtrue, onecase);
		else
			ret = classify(root.childfalse, onecase);
		end
	end
		
end