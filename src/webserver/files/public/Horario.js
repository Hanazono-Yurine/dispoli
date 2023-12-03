var xmlhttp = new XMLHttpRequest();
var url = "http://127.0.0.1:8080/get/arrive";

xmlhttp.onreadystatechange = function() {
	if (this.readyState == 4 && this.status == 200) {
		var myArr = JSON.parse(this.responseText);
    myFunction(myArr);
  }
};

xmlhttp.open("GET", url, true);
xmlhttp.send();

function myFunction(arr) {
	console.log(arr)
	console.log(arr[1])
	var i;
	for(i = 0; i < arr.length; i++) {
		var card = document.createElement('div');
		card.classList.add('card');
		var card_name = document.createElement('div');
		card_name.classList.add('card-bus-name');
		var card_arrive = document.createElement('div');
		card_arrive.classList.add('card-bus-arrive');
		var h3 = document.createElement('h3');
		var title = document.createTextNode("Ônibus -> " + arr[i].bus);
		var h5 = document.createElement('h5');
		var arrive_time = document.createTextNode("Chega em: " + arr[i].arrive);
		h3.appendChild(title);
		card_name.appendChild(h3);
		h5.appendChild(arrive_time);
		card_arrive.appendChild(h5);
		card.appendChild(card_name);
		card.appendChild(card_arrive)
		document.getElementById("arriveBox").appendChild(card);
	}
}
