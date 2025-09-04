# Works to be done

Also check out [keep note](https://keep.google.com/u/1/#NOTE/1Hj4tuKO1Is743Xui9a1YlJets8BuFt67Hl0a2BE_hkImtb1piwLENl4QS6IomJei1WIE)

## Steps

- devtools: load_all() # to avoid install and load
- devtools: check()
- devtools::check_win_devel() # Check on windows
- devtools::check_win_release()
- devtools::check_mac_release()
- devtools::spell_check()
- devtools::build_readme()
- urlchecker::url_check(".")
- devtools::check(args = c("--as-cran", "--no-manual")) # most important command to run locally

## Know Isues

- `/Example/clock_chart_qnt not found` occurrs if `library()` is not used
- For changing a test, editing and running test works, don't have to `load_all()`.

## Submission checklist

1. All functions are properly documented (grammar and clarity); Check web
2. All examples are well-explained, relevant, and practically useful
3. Works on many machines
4. Vignettes are fine
5. Users are given enough options/freedom in function variable
6. All basic goals are fulfilled
7. Run functions with all arguments and types (numeric, factor; add error, warning if not by default by parent pkg)
8. Follow R code style https://google.github.io/styleguide/Rguide.html
9. Check latex error: R CMD Rd2pdf --no-clean clockplot

## Important

- In conv_data.R, change time variable name
-  tidyr::separate_wider_delim(cols = {{ time }} may need to be changed to
 tidyr::separate_wider_delim(cols = time
 - plot time (HH:MM or HH:MM:SS), input as a vector or in a data frame
 
 Ideas

Why useful?  Show with examples  in readme and paper.

1. Add color var to clock_chart --done
2. Allow user to choose color or color brewer  in clock_chart_qlt --done
3. Make chat data better by manual manipulation --done
4. Add random large data in /data folder --should?
5. Add legend to *col -- done
6. Add segment by complex function --not a big deal --NO
7. If chr or factor is given to *col, show error and note --long shot
8. All func same arg format (data, df) --done
9. *qlt: legend name = variable name by default --skip
10. All function similar title  --done 
11. clock_chart title nor --done
12. Add titles to all plots --show option in examples --done
13. Fix desc of conv_hms --done
14. See also function --done
15. Data for cyclic chart, fix clyclic to cyclic --done
16. Year chart: change value pos? --later
17. share on Facebook --being done
18. Change desc and details for each --done
19. limit example -- done 
20. Check details part merged with title. Separate it --done
21. *qnt give better example; don't create data in example --done
22. *qnt legend by 2 variables -- done for now
23. len start from 0.5 or 0.6 to ... --done
24. Cran: # in readme, url 
25. cyclic and similar charts see also -- done
26. Facet wrap example -- can be added: facet_wrap(~type) -- show example in vignette
27. draw legend lines ----, ---------, -------------- to denote length --later
28. Recollect SMS data --done
29. Stop adding fearures. Move to submission process
30. Change clock_chart example title and edit  args --done
31. Week chart width not arg, show in example or think --don't bother --done
32. vignette: how to -- 2 parts clock_charts, period charts, base r clock
33. Check all documentation
34. Add tests (testit pkg, testthat)
35. train data; add all train
36. Plan_day rm set.seed --no problem found --done
37. Week_chart keep lgnm? --keep --done
38. Test: expect length for day chart, week chart etc. --done
39. Update vignettes: example of each data, default and custom plot --done
40. Document pkg p.51
41. Hm to hms instruction in all relevant functions
42. Check that all exported functions have @returns
43. 3 readme components 
44. Comment codes elaborately 
45. Correct vignette clockplot, use built-in data --done
46. Accidents: point by death, length by injured
47. Readme link to getting started --done
48. Vignette function ()
49. ggplot2 for developers. The link and linked link https://cran.r-project.org/web/packages/ggplot2/vignettes/ggplot2-in-packages.html
50.  Use {{ col }} format --done
51.  Qnt show difference with col chart in vignette
52.  conv: replace hour, minute, second by like hr, mn, sc. May conflict with existing column name --done
53.  Don't force user to convert to hms. Convert in function --done
54.  Hms test expect equal --done
55.  Hms update documentation --done
56.  Remove random example from function --done
57.  Remove len example from vignette --done
58.  Check qlt example in vignette -- bug --done
59.  Readme: keep only 2 charts. *qnt and week chart, keep US accidents 
60.  Explain clock_chart in vignette 
61.  Show example from kaggle US accident data --done
62.  Try creating a paper on algorithm first
63.  Read more about .... in function 
64. Manage NA
65. Qnt: function(a = 1, b = a * 2)

Examples
1. Earthquake daily
2. Text message receiving time, color by sender
3. Chat
4. Accident 
5. Train

### Issues

1. Readme issue: git commit --no-verify -m "my commit message"

### Ref

https://stackoverflow.com/questions/25489042/linking-to-other-packages-in-documentation-in-roxygen2-in-r


Next version 
1. Use 3 variable for length, color, point size
2. *qlt modify length by numeric, color by qlt
3. Qlt: if duplicate time, jitter length
4. qlt: letvuser choose colors
5. draw legend lines ----, ---------, -------------- to denote length
6. *qnt length and color by different variable 
7. Give user conv data
8. Show work at arbitrary time; also show time as text in front of line.
           -----------------------12:34
10. Cyclic charts lollipop type 
11. Color by factor, length by numeric
12. Group together functions by @family
13. Show example from cran pkg 
14. Qnt, plot two numeric (e.g. upload, download speed by time)
15. rename quake data, keep date, rearrange col
16. Add Linetype by variable
17. If manu events occur at sams time, show them by jutter / other manipulation 
18. remove needed len from conv_data()
https://cran.r-p
roject.org/src/contrib/Archive/ggplot2/
