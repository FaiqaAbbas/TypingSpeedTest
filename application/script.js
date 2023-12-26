<script>
////////////////////////////////////////////////////////////timer////////////////////////////////////////////////////
let wpm=0;
let wpmArray=[];
const navbar = document.querySelector('.navbar');
let timerFlag=1;
let startTime=60;
let currentTime=60;
let timeTaken=1;
let timer=document.getElementById("timer");
let button15=document.getElementById("btn-15");
let button30=document.getElementById("btn-30");
let button60=document.getElementById("btn-60");
let button120=document.getElementById("btn-120");
let buttonsetting=document.getElementById("btn-set");
let pauseButton=document.getElementById("btn-pause");
let pauseTime=60; 
function btn15(){
startTime=currentTime=pauseTime=15;
timer.innerText=15;
}
function btn30(){
startTime=currentTime=pauseTime=30;
timer.innerText=30;
}
function btn60(){
startTime=currentTime=pauseTime=60;
timer.innerText=60;
}
function btn120(){
startTime=currentTime=pauseTime=120;
timer.innerText=120;
}
function startTimer(){
startTime=pauseTime;
timerInterval=setInterval(updateTimer,1000); 
pauseButton.disabled=false;
pauseButton.hidden=false;
inpField.disabled=false;
hideButtons();   
}
function updateTimer(){
if(currentTime>0){
    currentTime--;
    wpmCalculator();
     wpmArray.push(wpm);
     console.log(wpmArray);    
    
    timeTaken=startTime-currentTime;
    pauseTime=currentTime;
    timer.innerText=currentTime;
}
else{
    currentTime=0;
    startTyping();
    if(timerFlag===0){
        nav.style.display='';
        timerFlag=1;
    }
}
}
function pauseTimer(){
timerFlag=0;
pauseButton.disabled=true;
pauseButton.hidden=true;
navbar.style.display = '';
clearInterval(timerInterval);  
}
function hideButtons(){
button15.hidden=true;
button30.hidden=true;
button60.hidden=true;
button120.hidden=true;
buttonsetting.hidden=true;
}
function showButtons(){
button15.hidden=false;
button30.hidden=false;
button60.hidden=false;
button120.hidden=false;
buttonsetting.hidden=false;
}



const paragraphs = "<?php echo $test->test_paragraph; ?>";
const typingText = document.querySelector(".typing-text p")
const inpField = document.querySelector(".input-field")
let closestSpanIndex=1;



function loadParagraph() {
    pauseButton.disabled=true;
    pauseButton.hidden=true;
    
    typingText.innerHTML = "";
    paragraphs.split("").forEach(char => {
    console.log(char);
    let span = `<span>${char}</span>`
    typingText.innerHTML += span;
});
typingText.querySelectorAll("span")[0].classList.add("active");
document.addEventListener("keydown", () => inpField.focus());
typingText.addEventListener("click", () => inpField.focus());
//     closestSpanArray=closestSpanCalculator();
}
loadParagraph(); 
let characters = typingText.querySelectorAll("span");
let wrongWords=0;
let charIndex=0 ;
let mistakes=0;
let isTyping=false;
let flag=0;
let spaceflag=0;
let typedWords=0;
let totalWords=0;
let timeUpFlag=0;
let accuracy=0;
let typedChar;
  
characters.forEach(element => {
if(element.innerText===" "){
    totalWords++;
}
});
let charactersRect;                                       
let typingTextRect= typingText.getBoundingClientRect();
function startTyping (){   
     accuracyCalculator();
    wrongWordCalculator();
    wpmCalculator();

    charactersRect=characters[charIndex].getBoundingClientRect();
    typedChar = inpField.value.split("")[charIndex];
    //for(let i=1; i<closestSpanArray.length-1;i++){
     //   const rect=closestSpanArray[i].getBoundingClientRect();
       // if(charactersRect.right == rect.right){
         //   if(typedChar==null){
               //	closestSpanIndex--;
            //}
            //else{
              //	 characters[charIndex].scrollIntoView();
                // closestSpanIndex++;
            //}
        //}
    //}
   if (charIndex < characters.length-1 && currentTime > 0) {
     characters[charIndex].scrollIntoView();
            
        if (!isTyping) {//if(true) the initial value of isTyping is false. We consider it not false to load the timer
            startTimer();
            isTyping = true;
        }
        if (typedChar == null) { // when backspace is pressed  
            if (charIndex > 0) {
                  charIndex--; 
                 if(j>0){	                         
                      j=charIndex-1;
                }
                if (characters[charIndex].classList.contains("incorrect")) {
                     mistakes--;
                }    
                characters[charIndex].classList.remove("correct", "incorrect");
            }
        }
        else{  

            if (characters[charIndex].innerText == typedChar) {
                characters[charIndex].classList.add("correct");
            } else{
                mistakes++;
                characters[charIndex].classList.add("incorrect");
            }
            charIndex++;          
               j=charIndex+1;
          
        }   
            characters.forEach(span => span.classList.remove("active"));
            characters[charIndex].classList.add("active");
    } 
    else{
        clearInterval(timerInterval); 
        if(timeUpFlag===0){ 
            timeUp();  
        }
    }
}
function timeUp(){
        timeUpFlag=1;
        inpField.value = "";
        lastCharacterCss();
        wrongWordCalculator();
        wpmCalculator();
        accuracyCalculator();
         
        var wpmArrayString=JSON.stringify(wpmArray);

        $.ajax({
        type: 'post',
        url: '<?php echo base_url();?>Test/insertTestResults',
        dataType:'json',
        data:{
            totalWords:totalWords,
            typedWords:typedWords,
            wrongWords:wrongWords,
            timeTaken:timeTaken,
            accuracy:accuracy,
            wpm:wpmArrayString},
        success: function(response){
                 
        }

    });
         window.location.href="<?php echo base_url();?>Test/showResults"; 
}
function wrongWordCalculator(){
        wrongWords=0;
        typedWords=0;
        for(i=0;i<=charIndex;i++){  
            if(characters[i].classList.contains("incorrect")){
                flag=1;
             }    
            if((characters[i].innerText===" " && flag==1)){      
                wrongWords+=1;
                flag=0;
            }
           if(characters[i].innerText==" "){
                typedWords+=1;
              }
           if(characters[i].innerText==="." && charIndex===characters.length-1){
                typedWords+=1;
           }
 
        }
}
function lastCharacterCss(){
    characters.forEach(span => span.classList.remove("active"));
        characters[charIndex].classList.add("active");
        if (characters[charIndex].innerText == typedChar) {
                characters[charIndex].classList.add("correct");
        } else{
                mistakes++;
                characters[charIndex].classList.add("incorrect");
       }
       characters.forEach(span => span.classList.remove("active"));
       
}       
function wpmCalculator(){
    if(typedWords>0){
        wpm = Math.round(((typedWords - wrongWords) / timeTaken) * 60);
    }
    else{
        wpm=0;
    }
}
function accuracyCalculator(){
    if(typedWords<=0){
        accuracy=0;
        wpm=0;
    }
    else{
        accuracy=Math.round( ((typedWords - wrongWords) /typedWords ) * 100);
    }
}

inpField.addEventListener("input",function(){
    navbar.style.display = 'none';
    startTyping();
    if(timerFlag===0){
        if(charIndex!==characters.length-1){
        startTimer();
        timerFlag=1;
       }
    }
});
window.addEventListener('wheel', function(e) {
     e.preventDefault();
}, { passive: false });
window.addEventListener("resize", function(){
    closestSpanArray=closestSpanCalculator();
    if(charIndex>0){
        characters[charIndex].scrollIntoView();
    }
});    


















 /////////////////////////////////////////////////////////////////////////////////////////////////////////////////               


let closestSpanArray=null;

// get the container element
function closestSpanCalculator(){                
const container = document.querySelector(".wrapper");

// get the width of the container element
const containerWidth = container.offsetWidth;//offsetWidth property returns and integer and it includes
                                                //padding and borders also

// get all the span elements
const spans = container.querySelectorAll("span");
const closestSpans=[];
// initialize an array to store the closest span for each line
// initialize variables to keep track of the current line and the closest span for the current line
let currentLine =0;
let closestSpan = null;
let closestSpanDistance = null;
// loop through all the span elements
// loop through all the span elements
for (let i = 0; i < spans.length; i++) {
  // get the current span element and its position
  const span = spans[i];
  const rect = span.getBoundingClientRect();
  // if the current span is on a new line, store the closest span for the previous line                            
  if (rect.top > currentLine) {
       closestSpans.push(closestSpan);   
                if(i!=0){
              //  closestSpan.style.border="2px solid green";

               }

                currentLine = rect.top;
                closestSpan = null;
                closestSpanDistance = null;
   }                                   

    // calculate the distance of the current span from the right edge of the container
    const distance = containerWidth - rect.right;
    // if the distance is negative, the span overflows the container and is not considered
    if (distance < 0) {
        continue;
    }

    // update the closest span for the current line if the current span is closer to the right edge of the container
    if (closestSpan === null || distance < closestSpanDistance) {
            closestSpan = span;
            closestSpanDistance = distance;
    }                            
}

// store the closest span for the last line
closestSpans.push(closestSpan);
return closestSpans;

}//function end


</script>