'use strict';

/**
 * @ngdoc function
 * @name 411t2App.controller:AdduserCtrl
 * @description
 * # AdduserCtrl
 * Controller of the 411t2App
 */
angular.module('411t2App')
  .controller('AdduserCtrl', function ($http) {
    

    var vm = this;
	var url = 'http://localhost:8000/sql/';

	vm.insert = function(formData){
		/**
		* POST Route /insert 
		* @params table - REQUIRED
		* @params attr - REQUIRED
		* Usage:
		* GET /sql/insert?table=Item&attr="Girl Scout Cookies", "Thin mints","Yummy snacks for all to enjoy!",  20.00, 1
		* Translated to MySQL: INSERT INTO table VALUES (attr);
		*/

		$http
			.post(url + 'insert', {
					table: 'User',
					attr: '"' + formData.firstName + '","' + formData.lastName + '","' + formData.email + '",' + formData.password + ',' +formData.phone + ',' + 1 // 1 at end is userId, hardcoded for now
			})
			.success(function(){
				alert('Item inserted.');
				formData.firstName = '';
				formData.lastName = '';
				formData.email = '';
				formData.password = '';
				formData.phone = '';
			});
	}


  });