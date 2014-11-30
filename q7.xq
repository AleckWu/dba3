let $uniqSkills := distinct-values(fn:doc("posting.xml")//reqSkill/@what)
let $resumes := fn:doc("resume.xml")//resume
return <skills> {
    for $s in $uniqSkills
        return 
            if ($resumes[//skill/@what = $s]) then
                <skill name='{string($s)}'> {
                    let $maxLevel := max($resumes//skill[./@what = $s]/@level)
                    for $level in (1 to xs:integer($maxLevel))
                        return
                            let $n := count($resumes//skill[./@what = $s and ./@level = $level])
                            return
                                if ($n > 0) then
                                    <count level='{$level}' n='{$n}'></count>
                                else ()

                } </skill>
            else ()
} </skills>
