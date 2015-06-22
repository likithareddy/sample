angular.module('starter.services', [])

/**
 * A simple example service that returns some data.
 */
.factory('Friends', function($q) {
  //get remotetk client
  var remoteTKClient = new remotetk.Client();
   
    //privately cache contact records from response as 'friends'
    var friends;
  
  //private function that returns AngularJS Promise
  function query(queryString) {
    var deferred = $q.defer();

    //Call RemoteTK's query API  
    remoteTKClient.query(queryString, 
      function(response) {
        friends = response.records; //store this privately
        deferred.resolve(friends);//return result as promised earlier
      },
      function(error) {
        alert(JSON.stringify(error));
        deferred.fail(error);//send error as promised earlier
      });

    //promise that we will return something (asynchoronusly in the future)
    return deferred.promise;
  };

   //Publicly expose APIs: 'all', 'findByName' and 'get'
  return {
    all: function() {
      return query('SELECT Id, Name, Title FROM contact LIMIT 50');
    },

    get: function(friendId) {
        debugger;
        for(var i = 0; i < friends.length; i++) {
            var friend = friends[i];
            if (friend.Id == friendId) {
                return friend;
    		}
  		}
    },
      
   findByName: function(searchKey) {
      return query('SELECT Id, Name, Title FROM contact WHERE name LIKE \'%' + searchKey + '%\' LIMIT 50');
    },
  }
});
