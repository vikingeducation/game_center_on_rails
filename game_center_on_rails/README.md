game_center_on_rails
====================

The Game Center finds its way onto the Web!

This is your README!

Alice & Xin


notes:
render board <- views
controller ->
(get) new: get only (new_game) game ID for specific game
(no create, index, show needed)

navigating pg (win/lose), methods,
(get) edit showing them board: click on column
place piece = update
game over = delete

model = gameboard, string field = array.to_json (flag to tell who's turn)
main game = controller (game loops/checks) and helpers (AI)
rendering and user interaction = views
