class DateControl {
  static int getDateLength (String duration){
    switch(duration){
      case "1 Day":{
        return 1;
      }
      break;

      case "5 Days":{
        return 5;
      }
      break;

      case "30 Days":{
        return 30;
      }
      break;

      case "60 Days":{
        return 60;
      }
      break;
    }
  }
}