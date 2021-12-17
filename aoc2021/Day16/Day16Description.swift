//
//  Day16Description.swift
//  aoc2021
//
//  Created by Andrew McKnight on Dec 5, 2021.
//

/**
 --- Day 16: Packet Decoder ---

 As you leave the cave and reach open waters, you receive a transmission from the Elves back on the ship.

 The transmission was sent using the Buoyancy Interchange Transmission System (BITS), a method of packing numeric expressions into a binary sequence. Your submarine's computer has saved the transmission in hexadecimal (your puzzle input).

 The first step of decoding the message is to convert the hexadecimal representation into binary. Each character of hexadecimal corresponds to four bits of binary data:

 0 = 0000
 1 = 0001
 2 = 0010
 3 = 0011
 4 = 0100
 5 = 0101
 6 = 0110
 7 = 0111
 8 = 1000
 9 = 1001
 A = 1010
 B = 1011
 C = 1100
 D = 1101
 E = 1110
 F = 1111
 The BITS transmission contains a single packet at its outermost layer which itself contains many other packets. The hexadecimal representation of this packet might encode a few extra 0 bits at the end; these are not part of the transmission and should be ignored.

 Every packet begins with a standard header: the first three bits encode the packet version, and the next three bits encode the packet type ID. These two values are numbers; all numbers encoded in any packet are represented as binary with the most significant bit first. For example, a version encoded as the binary sequence 100 represents the number 4.

 Packets with type ID 4 represent a literal value. Literal value packets encode a single binary number. To do this, the binary number is padded with leading zeroes until its length is a multiple of four bits, and then it is broken into groups of four bits. Each group is prefixed by a 1 bit except the last group, which is prefixed by a 0 bit. These groups of five bits immediately follow the packet header. For example, the hexadecimal string D2FE28 becomes:

 110100101111111000101000
 VVVTTTAAAAABBBBBCCCCC
 Below each bit is a label indicating its purpose:

 The three bits labeled V (110) are the packet version, 6.
 The three bits labeled T (100) are the packet type ID, 4, which means the packet is a literal value.
 The five bits labeled A (10111) start with a 1 (not the last group, keep reading) and contain the first four bits of the number, 0111.
 The five bits labeled B (11110) start with a 1 (not the last group, keep reading) and contain four more bits of the number, 1110.
 The five bits labeled C (00101) start with a 0 (last group, end of packet) and contain the last four bits of the number, 0101.
 The three unlabeled 0 bits at the end are extra due to the hexadecimal representation and should be ignored.
 So, this packet represents a literal value with binary representation 011111100101, which is 2021 in decimal.

 Every other type of packet (any packet with a type ID other than 4) represent an operator that performs some calculation on one or more sub-packets contained within. Right now, the specific operations aren't important; focus on parsing the hierarchy of sub-packets.

 An operator packet contains one or more packets. To indicate which subsequent binary data represents its sub-packets, an operator packet can use one of two modes indicated by the bit immediately after the packet header; this is called the length type ID:

 If the length type ID is 0, then the next 15 bits are a number that represents the total length in bits of the sub-packets contained by this packet.
 If the length type ID is 1, then the next 11 bits are a number that represents the number of sub-packets immediately contained by this packet.
 Finally, after the length type ID bit and the 15-bit or 11-bit field, the sub-packets appear.

 For example, here is an operator packet (hexadecimal string 38006F45291200) with length type ID 0 that contains two sub-packets:

 00111000000000000110111101000101001010010001001000000000
 VVVTTTILLLLLLLLLLLLLLLAAAAAAAAAAABBBBBBBBBBBBBBBB
 The three bits labeled V (001) are the packet version, 1.
 The three bits labeled T (110) are the packet type ID, 6, which means the packet is an operator.
 The bit labeled I (0) is the length type ID, which indicates that the length is a 15-bit number representing the number of bits in the sub-packets.
 The 15 bits labeled L (000000000011011) contain the length of the sub-packets in bits, 27.
 The 11 bits labeled A contain the first sub-packet, a literal value representing the number 10.
 The 16 bits labeled B contain the second sub-packet, a literal value representing the number 20.
 After reading 11 and 16 bits of sub-packet data, the total length indicated in L (27) is reached, and so parsing of this packet stops.

 As another example, here is an operator packet (hexadecimal string EE00D40C823060) with length type ID 1 that contains three sub-packets:

 11101110000000001101010000001100100000100011000001100000
 VVVTTTILLLLLLLLLLLAAAAAAAAAAABBBBBBBBBBBCCCCCCCCCCC
 The three bits labeled V (111) are the packet version, 7.
 The three bits labeled T (011) are the packet type ID, 3, which means the packet is an operator.
 The bit labeled I (1) is the length type ID, which indicates that the length is a 11-bit number representing the number of sub-packets.
 The 11 bits labeled L (00000000011) contain the number of sub-packets, 3.
 The 11 bits labeled A contain the first sub-packet, a literal value representing the number 1.
 The 11 bits labeled B contain the second sub-packet, a literal value representing the number 2.
 The 11 bits labeled C contain the third sub-packet, a literal value representing the number 3.
 After reading 3 complete sub-packets, the number of sub-packets indicated in L (3) is reached, and so parsing of this packet stops.

 For now, parse the hierarchy of the packets throughout the transmission and add up all of the version numbers.

 Here are a few more examples of hexadecimal-encoded transmissions:

 8A004A801A8002F478 represents an operator packet (version 4) which contains an operator packet (version 1) which contains an operator packet (version 5) which contains a literal value (version 6); this packet has a version sum of 16.
 620080001611562C8802118E34 represents an operator packet (version 3) which contains two sub-packets; each sub-packet is an operator packet that contains two literal values. This packet has a version sum of 12.
 C0015000016115A2E0802F182340 has the same structure as the previous example, but the outermost packet uses a different length type ID. This packet has a version sum of 23.
 A0016C880162017C3686B18A3D4780 is an operator packet that contains an operator packet that contains an operator packet that contains five literal values; it has a version sum of 31.
 Decode the structure of your hexadecimal-encoded BITS transmission; what do you get if you add up the version numbers in all packets?


*/
public enum Day16: String {
    case sample = """
<#sample input#>
"""

    case input = """
620D7B005DF2549DF6D51466E599E2BF1F60016A3F980293FFC16E802B325332544017CC951E3801A19A3C98A7FF5141004A48627F21A400C0C9344EBA4D9345D987A8393D43D000172329802F3F5DE753D56AB76009080350CE3B44810076274468946009E002AD2D9936CF8C4E2C472400732699E531EDDE0A4401F9CB9D7802F339DE253B00CCE77894EC084027D4EFFD006C00D50001098B708A340803118E0CC5C200A1E691E691E78EA719A642D400A913120098216D80292B08104DE598803A3B00465E7B8738812F3DC39C46965F82E60087802335CF4BFE219BA34CEC56C002EB9695BDAE573C1C87F2B49A3380273709D5327A1498C4F6968004EC3007E1844289240086C4D8D5174C01B8271CA2A880473F19F5024A5F1892EF4AA279007332980CA0090252919DEFA52978ED80804CA100622D463860200FC608FB0BC401888B09E2A1005B725FA25580213C392D69F9A1401891CD617EAF4A65F27BC5E6008580233405340D2BBD7B66A60094A2FE004D93F99B0CF5A52FF3994630086609A75B271DA457080307B005A68A6665F3F92E7A17010011966A350C92AA1CBD52A4E996293BEF5CBFC3480085994095007009A6A76DF136194E27CE34980212B0E6B3940B004C0010A8631E20D0803F0F21AC2020085B401694DA4491840D201237C0130004222BC3F8C2200DC7686B14A67432E0063801AC05C3080146005101362E0071010EC403E19801000340A801A002A118012C0200B006AC4015088018000B398019399C2FC432013E3003551006E304108AA000844718B51165F35FA89802F22D3801374CE3C3B2B8B5B7DDC11CC011C0090A6E92BF5226E92BF5327F3FD48750036898CC7DD9A14238DD373C6E70FBCA0096536673DC9C7770D98EE19A67308154B7BB799FC8CE61EE017CFDE2933FBE954C69864D1E5A1BCEC38C0179E5E98280
"""
}
