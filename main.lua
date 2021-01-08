local answers = {"rock", "paper", "scissors"}

math.randomseed(os.time())

local start = 1
local played = 0
local info = 0

local display = require "displayScores"
local check = require "checkScores"
_G.scores = {
  playerScore = 0,
  aiScore = 0
}

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
      io.write("The AI wins! " .. check() .. " and guessed " .. answers[ai] .. ". \n")
      if played == 0 then
        played = 1
      end
      start = 1
   elseif loweransw == answers[i + 1] and ai == i then
      scores.playerScore = scores.playerScore + 1
      io.write("You win! " .. check() .. " and guessed " .. answers[ai] .. ". \n")
      if played == 0 then
        played = 1
      end
      start = 1
   end
  end
  if loweransw == "scissors" and answers[ai] == "rock" then
    scores.aiScore = scores.aiScore + 1
    io.write("The AI wins! " .. check() .. " and guessed " .. answers[ai] .. ". \n")
    if played == 0 then
      played = 1
    end
    start = 1
  elseif loweransw == "rock" and answers[ai] == "scissors" then
    scores.playerScore = scores.playerScore + 1
    io.write("You win! " .. check() .. " and guessed " .. answers[ai] .. ". \n")
    if played == 0 then
      played = 1
    end
    start = 1
	elseif loweransw == "score" then
		display()
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
		display()
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