function ret = best (examples, attributes, target_attr)
	max = 0;
	for attr = attributes
		if gain(examples, attr, target_attr) > max
			ret = attr;
		end
	end
end