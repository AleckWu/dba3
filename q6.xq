let $resumes := fn:doc("resume.xml")//resume
let $skilledRes := $resumes[//skill]
return
    for $r1 in $skilledRes
        for $r2 in $skilledRes
            let $skills1 := $r1//skill
            let $skills2 := $r2//skill
            where every $s1 in $skills1 satisfies 
            $s1/@what[.=$skills2/@what] and $s1/@level = $skills2[./@what = $s1/@what]/@level and
            $r1 << $r2 and count($skills1) = count($skills2)
            return 
                <pair>
                    {$r1/string(@rID)}{$r2/string(@rID)}
                </pair>
