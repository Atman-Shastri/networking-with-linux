//Step 1 : Include headerfile
#include "ns3/core-module.h"
#include "ns3/network-module.h"
#include "ns3/internet-module.h"
#include "ns3/point-to-point-module.h"
#include "ns3/applications-module.h"


//netanim and mobility
#include "ns3/netanim-module.h"
#include "ns3/mobility-module.h"

// Default Network Topology
//
//       10.1.1.0
// n0 (10.1.1.1) -------------- n1 (10.1.1.2)
//    point-to-point
//
 
//Step 2: Adding namespace
using namespace ns3;
NS_LOG_COMPONENT_DEFINE ("FirstScriptExample");  //export NS_LOG=FSE=level_all

int
main (int argc, char *argv[])
{
 //CommandLine cmd (__FILE__);
 
//Declaration of Command line argument 

  CommandLine cmd;
  //cmd.AddValue("nPackets", "Number of packets to echo", nPackets);
  cmd.Parse (argc, argv);
  
  
//Step 3:keep track of time values and allow control of global simulation resolution
  Time::SetResolution (Time::NS);
  
//Enable the logging output associated with that log component.
  LogComponentEnable ("UdpEchoClientApplication", LOG_LEVEL_INFO);
  LogComponentEnable ("UdpEchoServerApplication", LOG_LEVEL_INFO);

//NodeContainer Class for create Nodes with using Create method
  NodeContainer nodes;  
  nodes.Create (2);  
  NS_LOG_INFO("Create Topology Completed");

// Helper class to create point to point topology 
  PointToPointHelper pointToPoint; 
  pointToPoint.SetDeviceAttribute ("DataRate", StringValue ("5Mbps"));
  pointToPoint.SetChannelAttribute ("Delay", StringValue ("2ms"));

//Installation of NetDevices on all created nodes
  NetDeviceContainer devices;
  devices = pointToPoint.Install (nodes);
  NS_LOG_INFO("Installing device on node completed"); 

//Installtion of Protocol Stack Class
  InternetStackHelper stack;
  stack.Install (nodes);

//Assigning Ip address to base network using SetBase() method
  Ipv4AddressHelper address;
  address.SetBase ("10.1.1.0", "255.255.255.0");
  Ipv4InterfaceContainer interfaces = address.Assign (devices);

 //Server Application with port no. 65535(==2^16  16 is total bits of address )
  UdpEchoServerHelper echoServer(65535);   

//Installtion of server application on node no. ==> 1
  ApplicationContainer serverApps = echoServer.Install (nodes.Get (1));
  serverApps.Start (Seconds (1.0));
  serverApps.Stop (Seconds (10.0));


 //Client Application 
  UdpEchoClientHelper echoClient(interfaces.GetAddress (1), 65535);
  echoClient.SetAttribute ("MaxPackets", UintegerValue (1));
  echoClient.SetAttribute ("MaxPackets", UintegerValue (1)); 
  echoClient.SetAttribute ("Interval", TimeValue (Seconds (1.0)));
  echoClient.SetAttribute ("PacketSize", UintegerValue (1024));

  ApplicationContainer clientApps = echoClient.Install (nodes.Get (0));
  clientApps.Start (Seconds (2.0));
  clientApps.Stop (Seconds (10.0));
  
  // NetAnimation   
  MobilityHelper mobility;
  mobility.SetMobilityModel("ns3::ConstantPositionMobilityModel");
  mobility.Install(nodes);

  AnimationInterface anim("first.xml");
  AnimationInterface::SetConstantPosition (nodes.Get(0), 10, 25);
  AnimationInterface ::SetConstantPosition(nodes.Get(1), 40,25);
  anim.EnablePacketMetadata(true);
  
// Creating pcap files for Wireshark-pcap : packet capture information
  pointToPoint.EnablePcapAll("first");
  
  Simulator::Run ();
  Simulator::Destroy ();
  return 0;
}

