

enum FlavourEnvirement{
   DEV,
   HML,
   PROD
}


class Flavour {
 static FlavourEnvirement? flavour;

 String  get baseUrl {
   switch(flavour){
     case   FlavourEnvirement.DEV:
       return "";
     case   FlavourEnvirement.HML:
       return "";
     case   FlavourEnvirement.PROD:
       return "";
     default:
       return "";
   }
 }



}