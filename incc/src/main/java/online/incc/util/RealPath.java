package online.incc.util;

public final class RealPath {

	public static String getRealPath(String path) {
	  String[] paths = path.split("\\\\");
	  StringBuffer realPath = new StringBuffer();
	  for(int i=0;i<paths.length-3;i++) {
		  realPath.append(paths[i]).append("/");
	  }
	  realPath.append("fileupload/");
	  return realPath.toString();
	}
	
	public static int getCode() {
		return (int)((Math.random()*9+1)*100000);
	}
}
