local function displayScores()
	if scores.playerScore == scores.aiScore then
		if scores.playerScore == 1 then
			io.write("You and the AI both have " .. scores.playerScore .. " point.\n")
		else
			io.write("You and the AI both have " .. scores.playerScore .. " points. \n")
		end
	elseif scores.playerScore ~= 1 and scores.aiScore == 1 then
		io.write("You have " .. scores.playerScore .. " points, and the AI has " .. scores.aiScore .. " point. \n")
	elseif playerScore == 1 and aiScore ~= 1 then
		io.write("You have " .. scores.playerScore .. " point, and the AI has " .. scores.aiScore .. " points. \n")
	elseif playerScore ~= 1 and aiScore ~= 1 then
		io.write("You have " .. scores.playerScore .. " points, and the AI has " .. scores.aiScore .. " points. \n")
	end
end

return displayScores