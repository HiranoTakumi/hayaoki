names = %w(Cho Koh Ueda Hotaru Yakuza Shuma Ks Joe Inaba okYama)
0.upto(9) do |idx|
  User.create(
    name: names[idx],
    password: "password",
    win: 0,
    lose: 0,
    draw: 0,
    score: idx
  )
end
