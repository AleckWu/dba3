
let $resumes := fn:doc("resume.xml")//resume
let $postings := fn:doc("posting.xml")//posting

let $numResumes := count($resumes)

for $posting in $postings
let $pSkill := $posting//reqSkill
let $numResWithThisSkill := count($resumes//skill[@what=$pSkill/@what])
let $numResWithThisSkillOver3 := count($resumes//skill[@what=$pSkill/@what][@level > 3])
where  $numResWithThisSkill < 0.5*$numResumes or $numResWithThisSkillOver3 < $numResWithThisSkill

return $posting/string(@pID)


