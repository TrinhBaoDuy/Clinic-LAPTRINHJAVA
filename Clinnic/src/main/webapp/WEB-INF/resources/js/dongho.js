
function updateCurrentTime() {
    var currentTime = new Date();
    var hours = currentTime.getHours();
    var minutes = currentTime.getMinutes();
    var seconds = currentTime.getSeconds();
    var formattedTime = ("0" + hours).slice(-2) + ":" + ("0" + minutes).slice(-2) + ":" + ("0" + seconds).slice(-2);
    document.getElementById("current-time").innerText = formattedTime;
}
// Cập nhật giờ hiện tại mỗi giây
setInterval(updateCurrentTime, 1000);


