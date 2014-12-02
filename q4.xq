let $resumes := fn:doc("resume.xml")//resume
let $postings := fn:doc("posting.xml")//posting

for $posting in $postings
    let $reqSkills := $posting//reqSkill
    where some $rs in $reqSkills satisfies
    not($rs/@level <= $resumes//skill[@what = $rs/@what]/@level)
    return $posting/string(@pID)
