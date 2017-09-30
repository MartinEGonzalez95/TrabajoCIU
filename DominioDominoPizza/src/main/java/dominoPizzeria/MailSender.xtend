package dominoPizzeria

import java.util.Properties
import javax.mail.Authenticator
import javax.mail.Message
import javax.mail.MessagingException
import javax.mail.PasswordAuthentication
import javax.mail.Session
import javax.mail.Transport
import javax.mail.internet.InternetAddress
import javax.mail.internet.MimeMessage
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class MailSender
{

	UserPasswordAuthentication authentication
	boolean comprobanteDeMailEnviado

	new(String usuario, String contraseña)
	{
		
		authentication = new UserPasswordAuthentication(usuario, contraseña)
		comprobanteDeMailEnviado = false
		
	}

	def enviarMail(String para, String asunto, String cuerpo)
	{

		try
		{
			
			comprobanteDeMailEnviado = true
			
			val message = new MimeMessage(createSession)
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(para))
			message.subject = asunto
			message.text = cuerpo

			Transport.send(message)
			
		}
		catch (MessagingException exception)
		{
			
			comprobanteDeMailEnviado = false
			
			exception.printStackTrace
			throw new RuntimeException(exception.message)
			
		}
	}

	private def createSession()
	{
		
		val props = new Properties => [
			put("mail.smtp.auth", "true")
			put("mail.smtp.starttls.enable", "true")
			put("mail.smtp.host", "smtp.gmail.com")
			put("mail.smtp.port", "587")
		]

		Session.getInstance(props, authentication)
		
	}
	
}

class UserPasswordAuthentication extends Authenticator
{

	val String username
	val String password

	new(String _username, String _password) {
		username = _username
		password = _password
	}

	override protected getPasswordAuthentication() { new PasswordAuthentication(username, password) }

}