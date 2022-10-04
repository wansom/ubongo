
const express = require("express");
const bodyParser = require("body-parser");
const cors = require("cors");
const videos = require("./routes/video-routes");

const app = express();

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));


app.use(cors());
//route handlers
app.use("/videos", videos);

//error handlers
app.use((req, res, next) => {
  const error = new Error("Not Found");
  error.status = 404;
  next(error);
});

app.use((error, req, res, next) => {
  res.status(error.status || 500);
  res.json({
    message: error.message,
  });
});

//app function wrappers
app.listen(process.env.port, () => {
    console.log(`Example app listening on port ${port}`)
  })