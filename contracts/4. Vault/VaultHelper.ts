import { expect } from "chai";
import { ethers, waffle } from "hardhat";

const helper = async (victim: any) => {
  /*
    Add code here that will help you pass the test
    Note: Unlock without using the string "A very strong password"
    Unlock the vault by somehow reading the private password from
    Vault directly
  */

  const storage = await ethers.provider.getStorageAt(victim.address, 1);
  const password = ethers.utils.parseBytes32String(storage);
  console.log("password:", password);
  await victim.unlock(storage);
};

export default helper;
