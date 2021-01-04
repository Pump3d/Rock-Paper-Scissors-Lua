local answers = {"rock", "paper", "scissors"}

math.randomseed(os.time())

local start = 1
local played = 0
local info = 0

local scores = {
  playerScore = 0,
  aiScore = 0
}

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

local function askPlayer()
  local ai = math.random(1, #answers)
  io.write("Rock, paper, or scissors? \n ")
  local answ = tostring(io.read())
  local loweransw = answ:lower()
  for i = 1, #answers do
   if loweransw == answers[i] and ai == i then
      io.write("Tie! \n")
      if played == 0 then
        played = 1
      end
      start = 1
   elseif loweransw == answers[i] and ai == i + 1 then
      scores.aiScore = scores.aiScore + 1
      io.write("The AI wins! " .. checkScores() .. " and guessed " .. answers[ai] .. ". \n")
      if played == 0 then
        played = 1
      end
      start = 1
   elseif loweransw == answers[i + 1] and ai == i then
      scores.playerScore = scores.playerScore + 1
      io.write("You win! " .. checkScores() .. " and guessed " .. answers[ai] .. ". \n")
      if played == 0 then
        played = 1
      end
      start = 1
   end
  end
  if loweransw == "scissors" and answers[ai] == "rock" then
    scores.aiScore = scores.aiScore + 1
    io.write("The AI wins! " .. checkScores() .. " and guessed " .. answers[ai] .. ". \n")
    if played == 0 then
      played = 1
    end
    start = 1
  elseif loweransw == "rock" and answers[ai] == "scissors" then
    scores.playerScore = scores.playerScore + 1
    io.write("You win! " .. checkScores() .. " and guessed " .. answers[ai] .. ". \n")
    if played == 0 then
      played = 1
    end
    start = 1
	elseif loweransw == "score" then
		displayScores()
		played = 1
		start = 1
  end
end

while start == 1 do
  start = 0
	if info == 0 then
		info = 1
		io.write("Some information about the game: This is a simple rock paper scissors project that I made for fun (Though I am still updating it). You can say 'score' at any time to display your \nscore as well as the AI's. I am planning on adding more features such as ASCII art so stay\ntuned!\n \n")
	end
  if played == 0 then
    io.write("Do you want to play the game? \n ")
  else
    io.write("\nDo you want to keep playing? \n ")
  end
  local answ = tostring(io.read())
  local loweransw = answ:lower()
  if loweransw == "yes" then
    askPlayer()
  elseif loweransw == "no" then
    io.write("Goodbye!")
  elseif loweransw == "score" then
		displayScores()
		played = 1
		start = 1
	end
end

local function start()
  io.write("Do you want to go first? \n")
  local answ = tostring(io.read())
  local loweransw = answ:lower()
  if loweransw == "yes" then
    askPlayer()
	end
end