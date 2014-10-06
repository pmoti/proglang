fun is_older(earlierDt : int*int*int, laterDt : int*int*int) = 
     if (#1 earlierDt = #1 laterDt) then
	if (#2 earlierDt = #2 laterDt) then
	       #3 earlierDt < #3 laterDt
	else
	    #2 earlierDt < #2 laterDt
    else
	#1 earlierDt < #1 laterDt

fun number_in_month(dates : (int*int*int) list, month : int) =
    if ((#2 (hd dates)) = month) then
	1 + number_in_month(tl(dates), month)
    else
	0 + number_in_month(tl(dates), month)

fun number_in_months(dates : (int*int*int) list, months : int list) = 
    number_in_month(dates, hd(months)) + number_in_months(dates, tl(months))

fun dates_in_month(dates : (int*int*int) list, month : int) =
    if ((#2 (hd dates)) = month) then
	(hd dates) :: dates_in_month(tl(dates), month)
    else
	dates_in_month(tl(dates), month)
    
fun dates_in_months(dates : (int*int*int) list, months : int list) = 
    dates_in_month(dates, hd(months)) :: dates_in_months(dates, tl(months))

fun get_nth(strlist : string list, n : int) =
    if (n=1) then
	hd strlist
    else
	get_nth(tl(strlist), n-1)

fun date_to_string(date : int*int*int) = 
    let
	val months = ["January", "February", "March", "April", "May", "June", 
		  "July", "August", "September", "October", "November", "December"]
    in
	get_nth(months, (#2 date)) ^ " " ^ Int.toString(#3 date) ^ ", " ^ Int.toString(#1 date)
    end

fun number_before_reaching_sum(sum : int, nums : int list) = 
    let 
	fun check_sum(running_cnt : int, rest_of_nums : int list, index : int) = 
	   if (running_cnt > sum) 
	   then index
	   else check_sum(running_cnt + hd rest_of_nums, tl rest_of_nums, index+1)
    in
	if hd nums > sum 
	then NONE
	else SOME (check_sum(hd nums + (hd (tl nums)), tl nums, 1))
    end

fun what_month(day_of_year : int) =
    number_before_reaching_sum(day_of_year, [31,28,31,30,31,30,31,31,30,31,30,31])

fun month_range(day1 : int, day2 : int) =
    let 
	fun count (from : int) =
	    if from = day2
	    then what_month(day2) :: []
	    else what_month(from) :: count(from+1)
    in
	if (day1 > day2)
	then []
	else count(day1)
    end

fun oldest(dates : (int*int*int) list) = 
    let 
	fun find_earliest_date(temp_earliest : (int*int*int), sub_dates : (int*int*int) list) =
	    if null sub_dates
	    then temp_earliest
	    else
		if (is_older(temp_earliest, hd sub_dates)) 
		then find_earliest_date(temp_earliest, tl sub_dates)
		else find_earliest_date(hd sub_dates, tl sub_dates)
    in
	if null dates
	then NONE
	else SOME (find_earliest_date(hd dates, tl dates))
    end

fun number_in_months_challenge(dates : (int*int*int) list, months : int list) =
    let 
	fun check_dupe(unique_months : int list, month_to_check : int, checklist : int list) =
	    if (hd checklist) = month_to_check 
	    then []
	    else if null (tl checklist) 
	    then month_to_check :: unique_months
	    else check_dupe(unique_months, month_to_check, tl checklist)

	fun remove_dupes(unique_months : int list, month : int, left_to_check : int list) =
	    if null left_to_check
	    then unique_months
	    else remove_dupes(check_dupe(hd(left_to_check) :: unique_months, hd (tl left_to_check)))
    in
	number_in_months(dates, remove_dupes([hd months], hd (tl months), tl (tl months)))
    end

fun dates_in_months_challenge(dates : (int*int*int) list, months : int) =
    let 
	fun check_dupe(unique_months : int list, month_to_check : int, checklist : int list) =
	    if (hd checklist) = month_to_check 
	    then []
	    else if null (tl checklist) 
	    then month_to_check :: unique_months
	    else check_dupe(unique_months, month_to_check, tl checklist)

	fun remove_dupes(unique_months : int list, month : int, left_to_check : int list) =
	    if null left_to_check
	    then unique_months
	    else remove_dupes(check_dupe(hd(left_to_check) :: unique_months, hd (tl left_to_check)))
    in
	dates_in_months(dates, remove_dupes(months))
    end

fun reasonable_date(date : int*int*int) = 
    let
	val thirty = [4,6,9,11]
	val thirtyone = [1,3,5,7,8,10,12]

	fun exists(list_to_check : int list, value : int) =
	    if (hd list_to_check = value) then true
	    else if null (tl list_to_check) then false
	    else exists(tl list_to_check, value)
			    
	fun is_leap_year(year : int) =
	    ((year mod 4 = 0 orelse year mod 400 = 0) andalso year mod 100 > 0)
    in
	if (#1 date < 1) then false
	else if (#2 date < 1 orelse #2 date > 12) then false
	else if (#3 date > 0 andalso #3 date < 29) then true
	else if (#3 date = 31  andalso exists(thirtyone, #2 date)) then true
	else if (#3 date = 30 andalso exists(thirty :: [thirtyone], #2 date)) then true
	else if (#3 date = 29 andalso (exists(thirty :: [thirtyone], #2 date) orelse is_leap_year(#1 date))) then true
	else false
    end
		 
