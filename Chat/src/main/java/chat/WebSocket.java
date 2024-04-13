package chat;


import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;
 
@ServerEndpoint("/chatting") //웹소켓
public class WebSocket {
	//클라이언트가 웹 소켓에 연결될 때 호출되는 메소드
	
	public void onOpen(Session session) {
		System.out.println("websocket OPEN : " + session.getId());
		
	}
	
	//모든 클라이언트에게 메시지를 브로드캐스트
	@OnMessage
	public void onMessage(String message, Session session) {
		System.out.println("받은 메시지 : " +message);
		
		try {
			for(Session clientSession : session.getOpenSessions()) {
				clientSession.getBasicRemote().sendText(message);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//클라이언트와 연결 닫힐 때 호출되는 메소드
	@OnClose
	public void onClose(Session session) {
		System.out.println("websocket close : " + session.getId());
	}
}