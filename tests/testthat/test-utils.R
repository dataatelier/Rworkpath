context("Test binding nested objects to one dataframe")
# Some dummy data
listOfDataFrames <- vector(mode = "list", length = 5)

for (i in 1:5) {
    listOfDataFrames[[i]] <- data.frame(a="A",
                             b=2, c=3)
}

expected_result <-  data.frame(a=c(rep("A", 5)), b=c(rep(2, 5)), c=c(rep(3, 5)))

test_that("raw_to_dataframe returns the correct structure", {
  expect_true(all(raw_to_dataframe(listOfDataFrames) == expected_result))
})
