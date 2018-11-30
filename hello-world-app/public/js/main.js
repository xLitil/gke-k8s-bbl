var app = new Vue({
  el: '#app',
  data: {
    message: 'Hello Vue!',
    hostname: ""
  },
  created: function () {
    var vm = this;
    axios.get('/host')
    .then(function (response) {
            vm.hostname = response.data.hostname
        })
  }
})
