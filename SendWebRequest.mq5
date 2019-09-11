void SendWebRequest()
{
   string body = "{\"identifier\": \"ID\", \"password\": \"PWD\" }";
   string cookie=NULL, headers = "X-IG-API-KEY: YOUR_API_KEY\r\nVERSION: 2\r\nAccept: application/json; charset=UTF-8\r\nContent-Type: application/json";
   char post[],result[];
   
   StringToCharArray(body, post, 0, StringLen(body), CP_UTF8);
   string url = "https://demo-api.ig.com/gateway/deal/session";
   
//--- Resetting the last error code
   ResetLastError();
   
   int res = WebRequest("POST", url, cookie, NULL, 500, post, ArraySize(post), result, headers);
   
   if(res==-1)
     {
      Print("Error in WebRequest. Error code  =",GetLastError());
      //--- Perhaps the URL is not listed, display a message about the necessity to add the address
      MessageBox("Add the address '"+url+"' to the list of allowed URLs on tab 'Expert Advisors'","Error",MB_ICONINFORMATION);
     }
   else
     {
      if(res==200)
        {
         //--- Successful download
         PrintFormat("The file has been successfully downloaded, File size %d byte.",ArraySize(result));
         //PrintFormat("Server headers: %s",headers);
         //--- Saving the data to a file
         int filehandle=FileOpen("url.txt",FILE_WRITE|FILE_BIN);
         if(filehandle!=INVALID_HANDLE)
           {
            //--- Saving the contents of the result[] array to a file
            FileWriteArray(filehandle,result,0,ArraySize(result));
            //--- Closing the file
            FileClose(filehandle);
           }
         else
            Print("Error in FileOpen. Error code =",GetLastError());
        }
      else 
      {
      string s_result= CharArrayToString(result);
      AppendText(s_result);
        PrintFormat("Request to '%s' failed, error code %d", url, res);
      }
     }
}
