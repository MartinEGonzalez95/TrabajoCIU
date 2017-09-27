package arenaDesktop.arenaDesktop.model

import org.uqbar.arena.filters.TextFilter
import org.uqbar.arena.widgets.TextInputEvent

class FiltroSoloDeLetras implements TextFilter {

	override boolean  accept(TextInputEvent event) {
		event.potentialTextResult.matches("[A-Z a-z ñ Ñ ]*")
	}

}
