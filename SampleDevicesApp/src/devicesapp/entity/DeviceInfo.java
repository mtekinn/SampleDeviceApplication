package devicesapp.entity;

public class DeviceInfo {
	private int m_id;
	private String m_name;
	private String m_host;
	private int m_port;
	
	public DeviceInfo(String name, String host, int port)
	{
		m_name = name;
		m_host = host;
		m_port = port;		
	}
	
	public int getId() {return m_id;}
	
	public void setId(int id) 
	{
		m_id = id + 1;
	}	
	
	public String getName() {return m_name;}
	
	public void setName(String name) 
	{
		m_name = name;
	}
	
	public String getHost() {return m_host;}
	
	public void setHost(String host) 
	{
		m_host = host;
	}
	
	public int getPort() {return m_port;}
	
	public void setPort(int port) 
	{
		m_port = port;
	}	
	
}
