var shouldRun = true;

function blockCpuFor(ms) {
	var now = new Date().getTime();
	var result = 0
	while(shouldRun) {
		result += Math.random() * Math.random();
		if (new Date().getTime() > now + ms)
			return;
	}
}

function start(desiredLoadFactor) {
	if (shouldRun) {
  	blockCpuFor(1000*desiredLoadFactor);
  	setTimeout(start, 1000 * (1 - desiredLoadFactor));
  }
}

module.exports = {

  startLoadGenerator: function(desiredLoadFactor) {
    start();
    shouldRun = true;
  },

  stopLoadGenerator: function() {
    shouldRun = false;
  }

}
