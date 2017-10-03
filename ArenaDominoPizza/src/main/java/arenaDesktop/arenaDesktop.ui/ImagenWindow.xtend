package arenaDesktop.arenaDesktop.ui

import arenaDesktop.arenaDesktop.app.DominosWindow
import arenaDesktop.arenaDesktop.model.Imagen
import java.awt.Color
import org.uqbar.arena.graphics.Image
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.Window
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

class ImagenWindow extends Window<Imagen> {

	new(WindowOwner owner) {
		super(owner, new Imagen)
		title = "Domino's logo"
		this.iconImage = "src/main/resources/DominoLogo.png"
	}

	override createContents(Panel mainPanel) {

		new Label(mainPanel) => [
			bindImageToProperty("pathImagen", [ imagePath |
				new Image(imagePath)
			])
		]

		new Button(mainPanel) => [
			caption = "Ir a ventana principal"
			onClick [this.abrirDominos]
		]

	}

	def abrirDominos() {
		this.close
		new DominosWindow(this).open

	}
}
