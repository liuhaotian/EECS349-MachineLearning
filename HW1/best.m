function ret = best (examples, attributes, target_attr)
	max = 0;
	for attr = attributes
		if gain(examples, attr, target_attr) > max
			ret = attr;
			max = gain(examples, attr, target_attr);
		end
	end
end