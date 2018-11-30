var app = new Vue({
  el: '#app',
  data: {
    message: 'K8S Demo application',
    host: {},
    config: {}
  },
  created: function () {
    var vm = this;
    axios.get('/host')
    .then(function (response) {
            vm.host = response.data
        })
    axios.get('/config.json')
    .then(function (response) {
            vm.config = response.data
        })
  }
})
