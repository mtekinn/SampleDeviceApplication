package devicesapp.repository;

import java.util.Vector;

import devicesapp.entity.DeviceInfo;

import java.util.ArrayList;
import java.util.List;

public final class SampleDeviceAppRepository {
	private static Vector<DeviceInfo> ms_devices = new Vector<>();
	
	public SampleDeviceAppRepository()
	{
		
	}
	public static boolean save(DeviceInfo deviceInfo)
	{
		return deviceInfo != null && ms_devices.add(deviceInfo);
	}
	
	public static List<DeviceInfo> findAll()
	{
		return ms_devices;
	}

	public static List<DeviceInfo> findDevicesByName(String name)
	{
		List<DeviceInfo> devices = new ArrayList<DeviceInfo>();
		
		for (DeviceInfo di : ms_devices)
			if (di.getName().equals(name))
				devices.add(di);
		return devices;
	}
	public static List<DeviceInfo> findDevicesByHost(String host)
	{
		List<DeviceInfo> devices = new ArrayList<DeviceInfo>();
		
		for (DeviceInfo di : ms_devices)
			if (di.getHost().equals(host))
				devices.add(di);
		return devices;
	}
}
