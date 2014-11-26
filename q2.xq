let $interviews := fn:doc("interview.xml")//interview
let $interviewers := fn:doc("interview.xml")//interviewer

for $interviewer in $interviewers
where $interviewer/@sID=$interviews/@sID and empty($interviews[@sID=$interviewer/@sID]//collegiality)
return $interviewer/string(@sID)



