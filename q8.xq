declare function local:calculateMatch($p as element()?, $r as element()?) as xs:double {
    sum(
        for $s in $p//reqSkill
            return 
                if ($r//skill[@what = $s/@what]/@level >= $s/@level)
                then $s/@importance
                else (-1 * $s/@importance)
    )
};

declare function local:assessmentAvg($ass as element()?) as xs:double {
    let $scoredAss := $ass/*[name() != "answers"]
    return sum(data($scoredAss)) div count($scoredAss)
};

let $interviews := fn:doc("interview.xml")//interview
let $postings := fn:doc("posting.xml")//posting
let $resumes := fn:doc("resume.xml")//resume
return <report> {
    for $i in $interviews
        let $p := $postings[./@pID = $i/@pID]
        let $r := $resumes[./@rID = $i/@rID]
        return <interview> {
            <who rID='{$r/@rID}' forename='{$r//forename}' surname='{$r//surname}'/>,
            <position>{string($p//position)}</position>,
            <match>{local:calculateMatch($p, $r)}</match>,
            <average>{local:assessmentAvg($i//assessment)}</average>
        } </interview>
} </report>
