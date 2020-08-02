screen.clear()

result = controllerMain()
score1 = controllerScore(p[1])
score2 = controllerScore(p[2])
-- result2 = controllerTest()

screen.setHTML(result)
screenp1.setHTML(score1)
screenp2.setHTML(score2)
-- scTest.setCenteredText(result2)