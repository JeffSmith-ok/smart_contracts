// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract EthSocial {
  struct UserStruct {
    string username;
    uint age;
    bool isUser;
  }

  mapping (address => UserStruct) users;
  address[] userList;

  function getUser(address _userAddress) public view returns (UserStruct memory) {
    require(users[_userAddress].isUser == true, "User doesn't exist");

    return users[_userAddress];
  }

  function getTotalUsers() public view returns (uint) {
    return userList.length;
  }
 
  function createUser(address _userAddress, string memory _username, uint _age) public returns (bool success) {
    require(_userAddress == msg.sender, "This isn't your address!");

    UserStruct memory user;

    user.username = _username;
    user.age = _age;
    user.isUser = true;

    userList.push(_userAddress);
    users[_userAddress] = user;

    return true;
  }
}

