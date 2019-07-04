# Patches applied to dplace-data v2.0.1 in this package

```diff
diff --git a/datasets/WNAI/codes.csv b/datasets/WNAI/codes.csv
index e5de115..76e61a3 100644
--- a/datasets/WNAI/codes.csv
+++ b/datasets/WNAI/codes.csv
@@ -214,10 +214,10 @@ WNAI65,1,Lower Austral,Lower Austral
 WNAI65,2,Upper Austral,Upper Austral
 WNAI65,3,Transition,Transition
 WNAI65,4,Canadian,Canadian
-WNAI65,5,1 and 2,2 and 2
-WNAI65,6,2 and 3,3 and 3
-WNAI65,7,3 and 4,4 and 4
-WNAI65,8,1 and 2 and 3,"1,2 and 4"
+WNAI65,5,1 and 2,1 and 2
+WNAI65,6,2 and 3,2 and 3
+WNAI65,7,3 and 4,3 and 4
+WNAI65,8,1 and 2 and 3,"1,2 and 3"
 WNAI65,9,2 and 3 and 4,"2,3 and 4"
 WNAI66,NA,Missing data,Missing data
 WNAI66,1,Absent or very rare,Absent or very rare
@@ -308,9 +308,9 @@ WNAI94,1,Absent or very rare,Absent or very rare
 WNAI94,2,Present,Present
 WNAI95,NA,Missing data,Missing data
 WNAI95,1,None,None
-WNAI95,2,1-5,11-15
+WNAI95,2,1-5,1-5
 WNAI95,3,6-10,6-10
-WNAI95,4,11-15,1-5
+WNAI95,4,11-15,11-15
 WNAI95,5,16-20,16-20
 WNAI95,6,21-25,21-25
 WNAI95,7,26-29,26-30
@@ -375,9 +375,9 @@ WNAI114,1,Absent or very rare,Absent or very rare
 WNAI114,2,Present,Present
 WNAI115,NA,Missing data,Missing data
 WNAI115,1,Absent or very rare,Absent or very rare
-WNAI115,2,1-5,11-15
-WNAI115,3,6-10,5-10
-WNAI115,4,11-15,1-5
+WNAI115,2,1-5,1-5
+WNAI115,3,6-10,6-10
+WNAI115,4,11-15,11-15
 WNAI115,5,16-19,16-19
 WNAI116,NA,Missing data,Missing data
 WNAI116,1,Absent or very rare,Absent or very rare
diff --git a/datasets/WNAI/societies.csv b/datasets/WNAI/societies.csv
index 23c8034..00f855c 100644
--- a/datasets/WNAI/societies.csv
+++ b/datasets/WNAI/societies.csv
@@ -1,6 +1,6 @@
 id,xd_id,pref_name_for_society,glottocode,ORIG_name_and_ID_in_this_dataset,alt_names_by_society,main_focal_year,HRAF_name_ID,HRAF_link,origLat,origLong,Lat,Long,Comment,glottocode_comment
 WNAI1,xd1431,North Tlingit,tlin1245,North Tlingit (J1),North Tlinkit,NA,Tlingit (NA12),http://ehrafworldcultures.yale.edu/collection?owc=NA12,59,136,59,-136,Original,"Note northern and southern tlingit considered distinct dialects of tli by some, but no codes available in Glottolog."
-WNAI2,xd1082,Tlingit,tlin1245,South Tlingit (J2),"Kolosh, Southern Tlingit, South Tlingit",NA,Tlingit (NA12),http://ehrafworldcultures.yale.edu/collection?owc=NA12,57,134,57,-133.59,Revised,"Note northern and southern tlingit considered distinct dialects of tli by some, but no codes available in Glottolog."
+WNAI2,xd1082,South Tlingit,tlin1245,South Tlingit (J2),"Kolosh, Southern Tlingit, South Tlingit",NA,Tlingit (NA12),http://ehrafworldcultures.yale.edu/collection?owc=NA12,57,134,57,-133.59,Revised,"Preferred name updated 9May2019 to distinguish from North Tlingit. Note northern and southern tlingit considered distinct dialects of tli by some, but no codes available in Glottolog."
 WNAI3,xd1068,Haida (Northern),nort2938,North Masset Haida (J3),North Masset Haida,NA,,,54,132,54,-132,Original,
 WNAI4,xd1438,Haida (Southern),sout2956,South Skidegate Haida (J4),South Skidegate Haida,NA,Haida (NE09),http://ehrafworldcultures.yale.edu/collection?owc=NE09,53,133,53.09,-132.1,Revised,
 WNAI5,xd1104,Tsimshian,nucl1649,Tsimshian (J5),Ts’msyan,NA,,,55.3,130,55.3,-130.05,Revised,

```

# Errata for variables in dplace-data v2.0.1

- WNAI24: Case 149 has a score of three, WNAI only lists present and absent as
  values. This was changed to missing data. [World Cultures 10(2), fall 1999]
- WNAI35: Cases 145 and 146 had values of 0; these were changed to missing
  data. [World Cultures 10(2), fall 1999]
- WNAI187: Case 137 had a score of 0. This was changed to missing data [World
  Cultures 10(2), fall 1999]
- WNAI205: Society 111 had a score of 99. This was changed to missing data.
  [World Cultures 10(2), fall 1999]
- WNAI270: Case 123 had a score of 11. This was changed to missing data [World
  Cultures 10(2), fall 1999]
- WNAI273: Case 77 had a score of zero. This was changed to missing data
  [World Cultures 10(2), fall 1999]
- WNAI295: Cases 32 and 45 had scores of 7. these were changed to missing data
  [World Cultures 10(2), fall 1999]
- WNAI301: Cases 17 and 122 had values of 4. These were changed to missing
  data. [World Cultures 10(2), fall 1999]
- WNAI311: Case 1 had a value of 5. This was changed to missing data. [World
  Cultures 10(2), fall 1999]
- WNAI314: Case 164 had a value of 4. This was changed to missing data. [World
  Cultures 10(2), fall 1999]
- WNAI323: Case 183 had a value of 8. This was changed to missing data. [World
  Cultures 10(2), fall 1999]
- WNAI333: Case 139 had a value of 23. This was changed to missing data.
  [World Cultures 10(2), fall 1999]
- WNAI336: Cases 140, 141 and 143 had values of 14. Case 144 had a value of
  15. Case 21 had a value of 21. All these were changed to missing data. [World
  Cultures 10(2), fall 1999]
- WNAI354: Case 64 had a value of 4. This was changed to missing data. [World
  Cultures 10(2), fall 1999]
- WNAI375: Case 123 had a value of 0. This was changed to missing data. [World
  Cultures 10(2), fall 1999]
- WNAI393: Case 171 had a value of 7. This was changed to missing data. [World
  Cultures 10(2), fall 1999]
- WNAI402: Case 95 had a value of 5. This was changed to missing data. [World
  Cultures 10(2), fall 1999]
