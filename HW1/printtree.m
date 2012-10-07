function printtree (root, prefix, titles)
	if root.label == 1
		disp(sprintf('%s : true', prefix));
	elseif root.label == 0
		disp(sprintf('%s : false', prefix));
	else
		disp(sprintf('%s%s = true', prefix, titles{root.attr}));
		printtree(root.childtrue, [prefix, '+'], titles);
		disp(sprintf('%s%s = false', prefix, titles{root.attr}));
		printtree(root.childfalse, [prefix, '+'], titles);
	end
		
end