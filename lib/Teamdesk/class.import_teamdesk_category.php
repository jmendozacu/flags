<?php
/**  
* @desc This class has functions to import the categories from TeamDesk to Pinnacle. 
* @package  TeamDesk  
* @author Dinesh Nagdev
* @since 21-January-2013 
*/          
class TeamDeskCategory {

    private $db;
    private $api;
    private $arrErrorLog; 
    private $tdErrorLog;
    private $dataset;
    private $categorycount; 
    private $update_rec;
     /**
     * @desc function to initiablize the database object
     */
    function __construct()
    {
        //$this->db = $db;  
    } 
    /**
    * @desc Function to connect to TeamDesk Category table
    * @return boolean True on successful connection, False on unsuccessful connection
    * @since 21-Jan-2013
    * @author Dinesh Nagdev
    */
    private function connectToTeamDesk()
    {   
        /**
        * @desc code to create the teamdesk api object with the domain name and database id.
        */
        try {
            $td_api = new API(TD_DOMAIN,TD_DB_ID,array("trace" => true)); 
            /**
            * @desc code to check the user login and session
            */
            $td_api->login(TD_USERNAME, TD_PASSWORD);  
            $this->api = $td_api;
        }
        catch (Exception $e) {
              echo 'Caught exception: ',  $e->getMessage(), "\n";
              $this->tdErrorLog = '<br/>Caught exception: ' .$e->getMessage(). "<br/>";
              exit;
              return $this->tdErrorLog;           
        }    

    }
    /**
    * @desc Function to import TeamDesk categories into Pinnalce database    
    * @since 22-Jan-2013
    * @author Dinesh Nagdev
    */
    public function importTeamDeskCategories()
    {   
        $arrTDCategories = array();
        $totalCategoryUpdated = 0;
        $totalCategoryAdded = 0;
        $this->categorycount = 0; 
        $this->update_rec = 0;
        if(TD_LIVE_FLAG == 0) {
           $this->pinnacleflag = 'betaPinnacleId'; 
        }
        else {
           $this->pinnacleflag = 'pinnacleId'; 
        }  
        /**
        * @desc  connect to TeamDesk category table
        */
        $this->connectToTeamDesk();
        if($this->api !='' )
        {   
             /**
             * @desc  get all the categories
             */
             /*if($_SESSION['arrTDCategories'] !='' && isset($_SESSION['arrTDCategories']) && count($_SESSION['arrTDCategories'])>0) {    
                $arrTDCategories = $_SESSION['arrTDCategories'];
            }
            else {   */
                $arrTDCategories = $this->getTDCategories();
               // $_SESSION['arrTDCategories'] = $arrTDCategories; 
            //}
             /**
             * @desc  echo "Categories == "; print_arr($arrCategories);          
             */
            if (isset($arrTDCategories)) {
                  $fp = fopen("var/import/category/categories.csv","w+");
                  if($fp) {
                      $csv_seperator = "";
                      $csv_line_break = "\n";
                      $csv_row = array();
                      $csv_row[] = "Name".$csv_seperator; 
                      $csv_row[] = "Path".$csv_seperator;
                      $csv_row[] = "Position".$csv_seperator;
                      $csv_row[] = "Is Active".$csv_seperator;
                      $csv_row[] = "Url Key".$csv_seperator;
                      $csv_row[] = "Description".$csv_seperator;
                      $csv_row[] = "Image".$csv_seperator;
                      $csv_row[] = "Page Title".$csv_seperator;
                      $csv_row[] = "Meta Keywords".$csv_seperator;
                      $csv_row[] = "Meta Description".$csv_seperator;
                      $csv_row[] = "Include In Menu".$csv_seperator; 
                      $csv_row[] = "Display Mode".$csv_seperator;
                      $csv_row[] = "CMS Block".$csv_seperator;
                      $csv_row[] = "Is Anchor".$csv_seperator;
                      $csv_row[] = "Availabe Sort By".$csv_seperator;
                      $csv_row[] = "Default Sort By".$csv_seperator;
                      $csv_row[] = "Page Layout".$csv_seperator;
                      $csv_row[] = "Custom Layout Update".$csv_seperator;
                      $csv_row[] = "Featured Category".$csv_seperator;  
                      $csv_row[] = "Custom URL".$csv_seperator; 
                      $csv_row[] = "Submenu Type".$csv_seperator; 
                      
                      fputcsv($fp,$csv_row);
                      foreach ($arrTDCategories as $tdCategory) {    
                            $image_path = str_replace("http://myclownantics.com/","/home/myclown/public_html/",$tdCategory['imgLocationCalced']);
                            if(file_exists($image_path) && $tdCategory['imgLocationCalced']!='') {
                                $filename = basename($tdCategory['imgLocationCalced']);
                                copy($image_path,"media/catalog/category/".$filename);
                            }    
                            $csv_row = array();
                            $csv_row[] = $tdCategory['labelCalc'].$csv_seperator; 
                            $pos = strrpos($tdCategory['Label'], $tdCategory['labelCalc']);
                            if($pos !== false)
                            {
                                $subject = substr_replace($tdCategory['Label'], "", $pos, strlen($tdCategory['labelCalc']));
                            }
                            $category_path = $subject;//str_replace($tdCategory['labelCalc'],"",$tdCategory['Label']);
                            $category_path = str_replace(": ","/",$category_path);
                            $category_path = $tdCategory["Level"]!=1 ? substr($category_path, 0, -1):$category_path;
                            $csv_row[] = ($tdCategory["Level"]==1?"Default Category":"Default Category/".$category_path).$csv_seperator; 
                            $csv_row[] = $tdCategory['Sort Order'].$csv_seperator; 
                            $csv_row[] = ($tdCategory['is_visible']=="Yes"?"Yes":"No").$csv_seperator; 
                            $csv_row[] = $csv_seperator; 
                            $csv_row[] = $tdCategory['description'].$csv_seperator; 
                            $csv_row[] = $filename.$csv_seperator; 
                            $csv_row[] = $csv_seperator; 
                            $csv_row[] = $tdCategory['meta_keywords'].$csv_seperator; 
                            $csv_row[] = $tdCategory['meta_description'].$csv_seperator; 
                            $csv_row[] = $tdCategory["labelCalc"]=='I Need'?"No":"Yes".$csv_seperator; 
                            $csv_row[] = "Products only".$csv_seperator; 
                            $csv_row[] = $csv_seperator; 
                            $csv_row[] = "Yes".$csv_seperator; 
                            $csv_row[] = $csv_seperator; 
                            $csv_row[] = $csv_seperator; 
                            $csv_row[] = "No layout updates".$csv_seperator; 
                            $csv_row[] = $csv_seperator;
                            $csv_row[] = ($tdCategory['is_home']=="Yes"?"1":"0").$csv_seperator;  
                            $csv_row[] = $csv_seperator;//str_replace("https://www.stripedsocks.com/","",$tdCategory['url'].
                            $csv_row[] = "1".$csv_seperator;
                            fputcsv($fp,$csv_row);
                      }    
                      fclose($fp);
                  }    
            }
            $strReturn = "Category CSV file generated Successfully.";
            return $strReturn; 
        } 
        else {
           return $this->tdErrorLog; 
        }   
    }
    /**
    * @desc Function to get all the categories from Teamdesk category table
    * @return array $arrCategories array of all the categories
    * @since 22-Jan-2013
    * @author Dinesh Nagdev
    */
    private function getTDCategories()
    {
        $arrCategories = array(); 
        /**
        * @desc  create the Teamdesk query, to fetch all the categories that are marked as sendToPinnacle
        */     
        $arrQueries = "WHERE ([CategoryID] > 0 AND [SendToPinnacle])"; 
        $orderBy = " ORDER BY [CategoryID],[Level]";          
        /**
        * @desc  create string of columns to be retrieved from the query
        */
        $strColumns = "[CategoryID],[Level],[labelCalc],[Label],[Sort Order],[is_home],[is_visible],[url],[description],[imgLocationCalced],[meta_keywords],[meta_title],[meta_description]";
        try {
               $query = "SELECT TOP 450 ".$strColumns." FROM [SS Category] ".$arrQueries.$orderBy; 
               $arrResults = $this->api->Query($query);  
               if (isset($arrResults->Rows)) {     
                        foreach($arrResults->Rows as $catResults) {  
                             $CatId = $catResults['CategoryID'];       
                             $arrCategories[] = $catResults;   
                        }             
               }
         }     
         catch (Exception $e) {
                echo $this->tdErrorLog = '<br/>Caught exception: ' .$e->getMessage(). "<br/>";
                $strReturn .= $this->tdErrorLog;           
         }
         $categories_count =  count($arrCategories);
         $last_category_id = $arrCategories[$categories_count-1]['CategoryID'];
         $resultcount = 0;
         while($resultcount == 0) {
                $arrResults='';
                $arrQueries = "WHERE ([CategoryID] > $last_category_id AND [SendToPinnacle])";   
                $orderBy = " ORDER BY [CategoryID],[Level]"; 
                try { 
                        $query = "SELECT TOP 450 ".$strColumns." FROM [SS Category] ".$arrQueries.$orderBy;  
                        $arrResults = $this->api->Query($query);
                        if (isset($arrResults->Rows)) {     
                              foreach($arrResults->Rows as $catResults) {    
                                   $CatId = $catResults['CategoryID'];       
                                   $arrCategories[] = $catResults;    
                              }
                              $categories_count =  count($arrCategories);
                              $last_category_id = $arrCategories[$categories_count-1]['CategoryID'];  
                        }
                 }
                 catch (Exception $e) {
                    echo $this->tdErrorLog = '<br/>Caught exception: ' .$e->getMessage(). "<br/>";
                    $strReturn .= $this->tdErrorLog;           
                  }
                  if(count($arrResults->Rows) > 0)
                       $resultcount = 0;
                  else
                       $resultcount = 1; 
          }      
          return  $arrCategories;
    }    

}    

?>

