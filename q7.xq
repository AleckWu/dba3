let $uniqSkills := distinct-values(fn:doc("posting.xml")//reqSkill/@what)
let $resumes := fn:doc("resume.xml")//resume
return <skills> {
    for $s in $uniqSkills
    where $resumes[//skill/@what = $s]
    return
        <skill name='{string($s)}'> {
            let $maxLevel := max($resumes//skill[./@what = $s]/@level)
            for $level in (1 to xs:integer($maxLevel))
                let $n := count($resumes//skill[./@what = $s and ./@level = $level])
                where ($n > 0)
                return <count level='{$level}' n='{$n}'></count>
        } </skill>
} </skills>
