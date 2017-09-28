package arenaDesktop.arenaDesktop.model

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.TransactionalAndObservable

@TransactionalAndObservable
@Accessors
class Imagen {
	def getPathImagen() {
		"DominoLogo.png"
	}

	def getTitle() {
		"Calate este logo papa"
	}
}
