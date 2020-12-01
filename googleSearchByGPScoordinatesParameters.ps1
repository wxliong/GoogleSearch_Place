param(
     [Parameter(Mandatory)]
     [string]$Location,
     
     [Parameter(Mandatory)]
     [float]$latitude,
 
     [Parameter(Mandatory)]
     [float]$longitude,

     [Parameter(Mandatory)]
     [string]$type,
 
     [Parameter(Mandatory)]
     [string]$keyword


     )


$response1 = Invoke-RestMethod -uri "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$($latitude),$($longitude)&radius=20000&type=$($type)&$($keyword)&key=My_APIKEY"


$S2=$response1.next_page_token

sleep 2   
$response2=Invoke-RestMethod -uri "https://maps.googleapis.com/maps/api/place/textsearch/json?pagetoken=$($S2)&key=My_APIKEY"
$S3=$response2.next_page_token
sleep 2
$response3=Invoke-RestMethod -uri "https://maps.googleapis.com/maps/api/place/textsearch/json?pagetoken=$($S3)&key=My_APIKEY"


# Print restaurant address and number */
# $response1.results|select Name,formatted_address,place_id | Out-String  "test version" 
$contacts=@()
$contacts=($response1.results).ForEach{ $_.place_id}
$contacts+=($response2.results).ForEach{ $_.place_id}
$contacts+=($response3.results).ForEach{ $_.place_id}

# SearchPlaceRestaurant Phone */
#$contacts=Get-Content .\RestaurantPlaceId.txt

$array=@()
foreach( $contact in $contacts){
$array+= (Invoke-RestMethod -uri "https://maps.googleapis.com/maps/api/place/details/json?placeid=$($contact)&key=My_APIKEY").result|select Name,formatted_address,formatted_phone_number,website
}

#$array|  out-string|Out-File .\googleSearchRestaurant1.txt
$array| Export-Csv googleSearch"$($location)".csv -NoTypeInformation

Write-Host " Google search completed found .. $($array.count) "    -ForegroundColor Yellow
Write-Host " The search result is saved as googleSearch$($location).csv " -ForegroundColor Yellow



