names = %w(Cho Koh Ueda Hotaru Yakuza Shuma Ks Joe Inaba okYama)
0.upto(9) do |idx|
  User.create(
    name: names[idx],
    password: "password",
    opponent: nil,
    win: 0,
    lose: 0,
    draw: 0,
    score: idx,
    result: nil,
    time: '7:00'
  )
end
