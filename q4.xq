
let $resumes := fn:doc("resume.xml")//resume
let $postings := fn:doc("posting.xml")//posting


for $posting in $postings, $pSkill in $posting//reqSkill
where $pSkill/@what[not(.=$resumes//skill/@what)] or $pSkill/@level > max($resumes//skill[./@what=$pSkill/@what]/@level)
return $posting/string(@pID)

