for $resume in fn:doc("resume.xml")//resume
where count($resume//skill)>3
return 
    <result>
        {$resume/string(@rID)}{$resume//forename}{count($resume//skill)}
    </result>
 

