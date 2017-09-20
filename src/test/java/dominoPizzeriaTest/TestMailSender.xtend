package dominoPizzeriaTest

import static org.junit.Assert.*
import org.junit.Test
import dominoPizzeria.MailSender

class TestMailSender
{
	
	MailSenderMock mailSenderMock
	
	@Test
	def sePruebaQueUnMailSenderEnvieUnMailDesdeUnCorreoValido()
	{
		
		mailSenderMock = new MailSenderMock("ciu.dominos.pizza@gmail.com", "interfaces2017")

		mailSenderMock.enviarMail("martinegonzalez95@gmail.com","Prueba!","Hola! Esto es una prueba")
		
		assertTrue(mailSenderMock.comprobanteDeMailEnviado)
	}
}

class MailSenderMock extends MailSender
{
	
	new(String usuario, String contraseña)
	{
		
		super(usuario, contraseña)
	
	}
	
	override enviarMail(String para, String asunto, String cuerpo)
	{ 

		comprobanteDeMailEnviado = true

	}
	
}