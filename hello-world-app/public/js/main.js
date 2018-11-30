var app = new Vue({
  el: '#app',
  data: {
    message: 'K8S Demo application',
    hostname: "",
    config: {}
  },
  created: function () {
    var vm = this;
    axios.get('/host')
    .then(function (response) {
            vm.hostname = response.data.hostname
        })
    axios.get('/config.json')
    .then(function (response) {
            vm.config = response.data
        })
  }
})
