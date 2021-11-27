pragma solidity >=0.5.16 <0.9.0;

contract stablecoin{
	address tor = ;
	mapping(address => uint) tokens;
	function approval(address _owner, address _approved,uint _tokenId){
		require(tokens[_owner]==_tokenId);
		tokens[_approved]=_tokenId;
	}
	function transfer(address _to, uint _amount) public payable{
		require(_amount <= tokens[msg.sender]);
		tokens[msg.sender]-=_amount;
		tokens[_to]+=_amount;
	}
	function balanceOf(address _owner) public view returns (uint){
		return tokens[_owner];
	}
	function ownerOf(uint _tokenId) public view returns(address){
		return tokens[_id].address;
	}
	function TransferFrom(address _from, address _to, uint _tokenId) payable{
		require(tokens[_from]==_tokenId);
		tokens[_from]=0;
		tokens[_to]=_tokenId;
	}
	function approve(address _approved, uint _tokenId) payable{
		require(tokens[msg.sender]==_tokenId);
		tokens[_approved]=_tokenId;
	}
	function mint(address _to, uint _amount) payable{
		tokens[tor]+=_amount;
		tokens[_to]+=_amount;

	}
	function burn(address _from,uint _amount) payable{
		tokens[tor]-=_amount;
		tokens[_from]-=_amount;
	}
}