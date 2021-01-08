local function checkScores()
  if scores.playerScore > scores.aiScore then
    local aiBehind = scores.playerScore - scores.aiScore
    if aiBehind == 1 then
      return("You are in the lead! The AI is " .. aiBehind .. " point behind you")
    else
      return("You are in the lead! The AI is " .. aiBehind .. " points behind you")
    end
  elseif scores.aiScore > scores.playerScore then
    local playerBehind = scores.aiScore - scores.playerScore
    if playerBehind == 1 then
      return("The AI is in the lead! They are " .. playerBehind .. " point ahead of you")
    else
      return("The AI is in the lead! They are " .. playerBehind .. " points ahead of you")
    end
  elseif scores.playerScore == scores.aiScore then
    if scores.playerScore == 1 then
      return("The AI and you are in a tie at " .. scores.playerScore .. " point!")
    else
      return("The AI and you are in a tie at " .. scores.playerScore .. " points!")
    end
  end
end

return checkScores