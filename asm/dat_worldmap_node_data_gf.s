	.section .rodata.dat_worldmap_node_data_gf, "a", %progbits
@ src/worldmap_node_data.o: gWMNodeData is a REGION-DIFFERENT asset, JP 0x081f5d7c..0x081f611c (US 0x082060b0, shift -0x10334); boundary pinned by region-same neighbours; incbin baserom.gba
@ Sibling table gWMNodeIconData (0x081f5c6c) is region-identical and now lives in real C (src/worldmap_node_data.c).
	.global gWMNodeData
gWMNodeData:
	@ de-pointered (scripts/repoint_table.py): ptr=87 data=143 skip=2
	.4byte 0x0B0B0100
	.4byte 0x00890000
	.4byte 0x01010000
	.4byte data_08AC2510 + 0x468
	.4byte data_08AC2510 + 0x52C
	.4byte data_08AC2510 + 0x61E
	.4byte 0x00580098
	.4byte 0x000005E2
	.4byte 0x02020101
	.4byte 0x00883838
	.4byte 0x0E090202
	.4byte data_08AC2510 + 0x46A
	.4byte data_08AC2510 + 0x52E
	.4byte data_08AC2510 + 0x620
	.4byte 0x00480058
	.4byte 0x000005E3
	.4byte 0x0A0A0200
	.4byte 0xFFFF0202
	.4byte 0x03030303
	.4byte data_08AC2510 + 0x46C
	.4byte data_08AC2510 + 0x530
	.4byte data_08AC2510 + 0x622
	.4byte 0x00780078
	.4byte 0x000005E4
	.4byte 0x0B0B0200
	.4byte 0xFFFF0303
	.4byte 0x04040404
	.4byte data_08AC2510 + 0x47E
	.4byte data_08AC2510 + 0x532
	.4byte data_08AC2510 + 0x624
	.4byte 0x00980078
	.4byte 0x000005E5
	.4byte 0x0F0F0200
	.4byte 0xFFFF0404
	.4byte 0x05050505
	.4byte data_08AC2510 + 0x480
	.4byte data_08AC2510 + 0x534
	.4byte data_08AC2510 + 0x626
	.4byte 0x00980098
	.4byte 0x000005E6
	.4byte 0x0A0A0100
	.4byte 0x00880606
	.4byte 0x01010606
	.4byte data_08AC2510 + 0x482
	.4byte data_08AC2510 + 0x536
	.4byte data_08AC2510 + 0x628
	.4byte 0x00B70098
	.4byte 0x000005E7
	.4byte 0x0F0F0200
	.4byte 0xFFFF0707
	.4byte 0x07070707
	.4byte data_08AC2510 + 0x498
	.4byte data_08AC2510 + 0x544
	.4byte data_08AC2510 + 0x62A
	.4byte 0x00C800B8
	.4byte 0x000005E8
	.4byte 0x05050100
	.4byte 0xFFFF0808
	.4byte 0x08080808
	.4byte data_08AC2510 + 0x49A
	.4byte data_08AC2510 + 0x546
	.4byte data_08AC2510 + 0x62C
	.4byte 0x00D800D8
	.4byte 0x000005E9
	.4byte 0x05050100
	.4byte 0xFFFF0909
	.4byte 0x05050505
	.4byte data_08AC2510 + 0x49C
	.4byte data_08AC2510 + 0x548
	.4byte data_08AC2510 + 0x62E
	.4byte 0x00D800D8
	.4byte 0x000005EA
	.4byte 0x0A0A0100
	.4byte 0xFFFF0A0A
	.4byte 0x0A0A0A0A
	.4byte data_08AC2510 + 0x49E
	.4byte data_08AC2510 + 0x54A
	.4byte data_08AC2510 + 0x630
	.4byte 0x003800D8
	.4byte 0x000105EB
	.4byte 0x0F0F0200
	.4byte 0xFFFF0B0B
	.4byte 0x0B0B0B0B
	.4byte data_08AC2510 + 0x4B8
	.4byte data_08AC2510 + 0x566
	.4byte data_08AC2510 + 0x632
	.4byte 0x006800D8
	.4byte 0x000005EC
	.4byte 0x09090100
	.4byte 0xFFFF3D3D
	.4byte 0x0C0C0C0C
	.4byte data_08AC2510 + 0x4BA
	.4byte data_08AC2510 + 0x568
	.4byte data_08AC2510 + 0x634
	.4byte 0x00680108
	.4byte 0x000005ED
	.4byte 0x0F0F0200
	.4byte 0xFFFF0D0D
	.4byte 0x0D0D0D0D
	.4byte data_08AC2510 + 0x4BC
	.4byte data_08AC2510 + 0x580
	.4byte data_08AC2510 + 0x636
	.4byte 0x00880138
	.4byte 0x000005EE
	.4byte 0x07070100
	.4byte 0xFFFF0E0E
	.4byte 0x13131313
	.4byte data_08AC2510 + 0x4BE
	.4byte data_08AC2510 + 0x582
	.4byte data_08AC2510 + 0x638
	.4byte 0x00C80138
	.4byte 0x000005EF
	.4byte 0x0B0B0200
	.4byte 0xFFFF1717
	.4byte 0x0F0F0F0F
	.4byte data_08AC2510 + 0x4C0
	.4byte data_08AC2510 + 0x584
	.4byte data_08AC2510 + 0x63A
	.4byte 0x00980048
	.4byte 0x000005F0
	.4byte 0x0F0F0200
	.4byte 0xFFFF1818
	.4byte 0x10101010
	.4byte data_08AC2510 + 0x4C2
	.4byte data_08AC2510 + 0x586
	.4byte data_08AC2510 + 0x63C
	.4byte 0x00E80048
	.4byte 0x000105F1
	.4byte 0x0A0A0100
	.4byte 0xFFFF3E3E
	.4byte 0x11111111
	.4byte data_08AC2510 + 0x4DC
	.4byte data_08AC2510 + 0x5A2
	.4byte data_08AC2510 + 0x63E
	.4byte 0x00F80098
	.4byte 0x000105F2
	.4byte 0x0F0F0200
	.4byte 0xFFFF1A1A
	.4byte 0x12121212
	.4byte data_08AC2510 + 0x4DE
	.4byte data_08AC2510 + 0x5BA
	.4byte data_08AC2510 + 0x640
	.4byte 0x010800C8
	.4byte 0x000005F3
	.4byte 0x08080100
	.4byte 0xFFFF1B1B
	.4byte 0x13131313
	.4byte data_08AC2510 + 0x4E0
	.4byte data_08AC2510 + 0x5BC
	.4byte data_08AC2510 + 0x642
	.4byte 0x01080108
	.4byte 0x000005F4
	.4byte 0x07070100
	.4byte 0xFFFF1C0F
	.4byte 0x14141414
	.4byte data_08AC2510 + 0x4E2
	.4byte data_08AC2510 + 0x5BE
	.4byte data_08AC2510 + 0x66C
	.4byte 0x00C80138
	.4byte 0x000005F5
	.4byte 0x06060100
	.4byte 0xFFFF1D10
	.4byte 0x15151515
	.4byte data_08AC2510 + 0x4E4
	.4byte data_08AC2510 + 0x5DC
	.4byte data_08AC2510 + 0x696
	.4byte 0x009800D8
	.4byte 0x000005F6
	.4byte 0x0F0F0200
	.4byte 0xFFFF1E11
	.4byte 0x16161616
	.4byte data_08AC2510 + 0x4E6
	.4byte data_08AC2510 + 0x5DE
	.4byte data_08AC2510 + 0x698
	.4byte 0x00A80168
	.4byte 0x000005F7
	.4byte 0x0F0F0200
	.4byte 0xFFFF1F12
	.4byte 0x17171717
	.4byte data_08AC2510 + 0x502
	.4byte data_08AC2510 + 0x5F6
	.4byte data_08AC2510 + 0x69A
	.4byte 0x00780168
	.4byte 0x000005F8
	.4byte 0x03030100
	.4byte 0xFFFF2013
	.4byte 0x19191919
	.4byte data_08AC2510 + 0x504
	.4byte data_08AC2510 + 0x5F8
	.4byte data_08AC2510 + 0x69C
	.4byte 0x00580188
	.4byte 0x000005F9
	.4byte 0x0F0F0200
	.4byte 0xFFFFFFFF
	.4byte 0xFFFFFFFF
	.4byte data_08AC2510 + 0x522
	.4byte data_08AC2510 + 0x614
	.4byte data_08AC2510 + 0x6C6
	.4byte 0x00480158
	.4byte 0x000005FA
	.4byte 0x0C0C0100
	.4byte 0xFFFF2114
	.4byte 0xFFFFFFFF
	.4byte data_08AC2510 + 0x524
	.4byte data_08AC2510 + 0x616
	.4byte data_08AC2510 + 0x6C8
	.4byte 0x00580138
	.4byte 0x000005FB
	.4byte 0x0D0D0303
	.4byte 0xFFFF2424
	.4byte 0xFFFFFFFF
	.4byte data_08AC2510 + 0x526
	.4byte data_08AC2510 + 0x618
	.4byte data_08AC2510 + 0x6CA
	.4byte 0x00380098
	.4byte 0x000005FC
	.4byte 0x0E0E0303
	.4byte 0xFFFF2E2E
	.4byte 0xFFFFFFFF
	.4byte data_08AC2510 + 0x528
	.4byte data_08AC2510 + 0x61A
	.4byte data_08AC2510 + 0x6CC
	.4byte 0x00B80198
	.4byte 0x000005FD
	.4byte 0x0F0F0202
	.4byte 0xFFFF3939
	.4byte 0xFFFFFFFF
	.4byte data_08AC2510 + 0x52A
	.4byte data_08AC2510 + 0x61C
	.4byte data_08AC2510 + 0x6CE
	.4byte 0x00280158
	.4byte 0x000105FE
