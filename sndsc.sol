

pragma solidity ^0.6.8;

contract SupplyChainManagment {
    struct SparePart {
        string partName;
        string partType;
        string uniqueNumber;
        address manufacturer;
    }
    
    struct Inventory {
        mapping(bytes32 => address) spareParts;
        mapping(bytes32 => address) prds;
    }
    
    
    constructor() public {}
    
    mapping(bytes32 => SparePart) public spareParts;
    Inventory inventory = Inventory();
    
    event ChangeInPartOwner(bytes32 indexed itemIndex, address indexed account);
    event changeInProductOwner(bytes32 indexed itemIndex, address indexed account);













    //add the sparePart to the Inventory
    //SparePart is updated to the map aganist hash
    //hash is generated using generateHash
    function createSpare(string memory partName, string memory partType, string memory uniqueNumber) public  returns(bytes32){
        address manufacturer = msg.sender;
        
        //generate the hash
        bytes32  itemHash = generateHash(uniqueNumber, manufacturer);
        
        
        //add SparePart
        require(spareParts[itemHash].manufacturer == address(0), "SparePart with same Serial Number is available in the inventory");
        SparePart memory item = createSparePart(partName, partType, uniqueNumber, manufacturer);
        spareParts[itemHash] = item;
        
        
        return itemHash;
    }
    function createProduct() public {}
    
    
    
    
    
    
    
    
    
    


    //this is like adding the item to the inventory 
    //only the itemHash <--> owner address is mapped
    //the no. of items is not managed
    //like regular inventory idea
    //push the event to transitionlogs
    //Dapp can access the logs to show the history
    function addSpareToInventory(bytes32 itemHash) public returns(address){
        require(spareParts[itemHash].manufacturer != address(0), "Spare not found to add to the inventory"); //item should be created
        require(inventory.spareParts[itemHash] == address(0), "Spare part is registered in the inventory"); //item should not be in the inventory
        require(spareParts[itemHash].manufacturer == msg.sender, "Spare Part is not created by the user"); //item can be put into inventory only by its owner
        inventory.spareParts[itemHash] = msg.sender;
        emit ChangeInPartOwner(itemHash, msg.sender);
        return spareParts[itemHash].manufacturer;
    }
    function addProductToInventory(bytes32 itemHash) public {}
    
    
    
    //this is like doing sale (Secondary / PO / PR)
    //only the itemHash <--> owner address in the map is changed
    //push the event to transitionlogs
    //Dapp can access the logs to show the history
    function tranferSparePartRights(bytes32 itemHash, address to) public {
        require(inventory.spareParts[itemHash] == msg.sender, "Illegal Operation! User is not permited"); //only item owner can do the sale
        inventory.spareParts[itemHash] = to;
        emit ChangeInPartOwner(itemHash, msg.sender);
    }





    
    
    //create the object from the SparePart struct
    function createSparePart(string memory partName, string memory partType, string memory uniqueNumber, address manufacturer) private pure returns(SparePart memory sparePart){
        return SparePart(partName, partType, uniqueNumber, manufacturer);
    }
    
    
    //will generate the keccak256 hash
    //this will serve as the unique key for the item accros the blockchain
    function generateHash(string memory uniqueNumber, address manufacturer) private pure returns(bytes32  hash){
        bytes20  manB = bytes20(manufacturer);
        bytes32  itemHash = keccak256(abi.encodePacked(uniqueNumber,manB));
        return itemHash;
    }
}
