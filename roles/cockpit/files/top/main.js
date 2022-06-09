const output = document.getElementById("output");
const button = document.getElementById("button");


// Create and run the "run" function
(function run() {
	output.innerText = "";
	/* global cockpit */
	cockpit.spawn(["top", "-bn", "1"])
		.stream(data => {
			// append the data to our output element
			output.append(document.createTextNode(data));
		})
		.catch((error) => console.log(error));
})();

window.onload = function () {
	// Reload page on button click
	button.onclick = () => {
		location.reload();
	};

	// setInterval(run, 3000);
}

// Send a 'init' message.  This tells integration tests that we are ready to go
cockpit.transport.wait(function () { });