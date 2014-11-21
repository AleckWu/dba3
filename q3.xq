
for $posting in fn:doc("posting.xml")//posting
for $skill in $posting//reqSkill
where $skill/@importance = max($posting//reqSkill/@importance)
return 
    <most_important_skill>
        {$skill/string(@what)}, {$skill/string(@importance)}
    </most_important_skill>

