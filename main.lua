-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here

-- hide status bar 
display.setStatusBar(display.HiddenStatusBar)

-- set background color
display.setDefault("background", 120/255, 255/255, 150/255)

-- Local Variables 
local questionObject
local correctObject 
local incorrectObject
local NumericField
local randomNumber1
local randomNumber2 
local userAnswer
local correctAnswer
local incorrectAnswer
local operator
local heart1
local heart2 
local heart3 
local lives = 3
local timer



-- decrement the number of seconds 
secondsLeft = secondsLeft - 1
-- display the number of seconds left in the clock object 
clockText.text = secondsLeft .. ""

   if (secondsLeft == 0 ) then
   	 	-- reset the number of seconds left 
   	 	secondsLeft = totalSeconds 
     	lives = lives - 1 

     	-- *** IF THERE ARE NO LIVES LEFT, PLAY A LOSE SOUNDS, SHOW A YOU LOSE IMAGE 
     	-- AND CANCEL THE TIMER REMOVE THE THIRD HEART BY MAKING IT INVISIBLE
      	if (lives == 2) then 
     	  	heart3.isVisible = false
       	elseif (lives == 1) then 
     	 	heart2.isVisible = false 
     	elseif (lives == 0) then 
     		heart1.isVisible = false  
     	end 

     	-- *** CALL THE FUNCTION TO ASK A NEW QUESTION 
     

    end 




-- Local Function 
local function AskQuesion()

	-- generate 2 numbers 
	randomNumber1 = math.random(0, 10)
	randomNumber2 = math.random(0, 10)

	-- generate operator
    operator = math.random(1, 4)



   if (operator == 1) then 
   		correctAnswer = randomNumber1 + randomNumber2 
    	questionObject.text = randomNumber1.."+".. randomNumber2
   end 
   if (operator == 2) then 
   	 correctAnswer = randomNumber1 - randomNumber2
   	 questionObject.text = randomNumber1.."-".. randomNumber2
   end 
   if (operator == 3) then 
     correctAnswer  = randomNumber1 * randomNumber2
     questionObject.text = randomNumber1.."*".. randomNumber2
   end 
   if (operator == 4) then 
   	 correctAnswer = randomNumber1 * randomNumber2 
   	 randomNumber1 = correctAnswer
   	 correctAnswer = randomNumber1/randomNumber2
   	 questionObject.text = randomNumber1.."/".. randomNumber2
   end 
    
end 
  
local function HideCorrect()
  correctObject.isVisible = false
  AskQuesion() 
end 

local function NumericFieldListener( event )

 	-- user begins editing "numericField"
  	if ( event.phase == "began" ) then 

 		-- clear text field
 		event.target.text = "" 

 	elseif event.phase == "submitted" then 

    	-- when the answer is submitted (enter key is pressed) set user input to users answer
 	  	userAnswer = tonumber(event.target.text)

 	   -- if the users answer and the correct answer are the same 
 		if  (userAnswer == correctAnswer) then 
 			correctObject.isVisible = true 
 		 	timer.performWithDelay(2000, HideCorrect)
 		 	event.target.text = ""

 	    -- if the users answer and the correct answer are  not the same 
 		else    
 			lives  = lives - 1 
 			if (lives == 2) then 
     	  	heart3.isVisible = false
       	elseif (lives == 1) then 
     	 	heart2.isVisible = false 
     	elseif (lives == 0) then 
     		heart1.isVisible = false  
     	 

 		 end 
 	end  
end  

 
 


 
    
     
    
 


----------------------------------------
  -- OBJECT CREATION 
----------------------------------------
-- display a question and set color
questionObject = display.newText( " " , display.contentWidth/3, display.contentHeight/2, nil, 50 )
questionObject:setTextColor(155/255, 42/255, 198/255)

-- create the correct text object and make it invisible
correctObject = display.newText( "Correct!" , display.contentWidth/2, display.contentHeight*2/3, nil, 50 )
correctObject:setTextColor(155/255, 42/255, 198/255)
correctObject.isVisible = false

-- create the incorrect text object 
incorrectObject = display.newText( "Incorrect!" , display.contentWidth/2, display.contentHeight*2/3, nil, 50 )
incorrectObject:setTextColor(155/255, 42/255, 198/255)
incorrectObject.isVisible = false
-- create numeric field 
numericField = native.newTextField( display.contentWidth/2, display.contentHeight/2, 150, 80 )
numericField.inputType = "number"

-- add event listeners for the numeric field 
numericField:addEventListener( "userInput", NumericFieldListener )

clockText = display.newText( "", display.contentWidth/3, display.contentHeight/3, nil, 60 )
clockText:setTextColor( 5/255, 105/255, 100/255)

-- keeps track of number of lives
lives = 3


-- create the lives on the ipad
heart1 = display.newImageRect("pixel.png", 100, 100)
heart1.x = display.contentWidth * 7 / 8 
heart1.y = display.contentHeight * 1 / 7

heart2 = display.newImageRect("Pixel.png", 100, 100)
heart2.x = display.contentWidth * 6 / 8
heart2.y = display.contentHeight * 1 / 7 

heart3 = display.newImageRect("Pixel.png", 100, 100)
heart3.x = display.contentWidth * 5 / 8
heart3.y = display.contentHeight * 1 / 7 

-- if user gets wrong answer then user will loose a life 







----------------------------------------
--FUNCTION CALLS 
---------------------------------------

-- call the function to ask the question 
AskQuesion()


  























 		
    
  

 

