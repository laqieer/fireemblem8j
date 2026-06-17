	.syntax unified
	.set GetROMChapterStruct, 0x08034520 + 1
	.set RefreshEntityBmMaps, 0x08019ECC + 1
	.set sub_8019914, 0x08019914 + 1
	.set sub_8019994, 0x08019994 + 1
	.set MakeNew6CBMXFADE2, 0x0801DA50 + 1
	.set sub_8027144, 0x08027144 + 1
	.section .text.sub_800BD98, "ax", %progbits
@ sub_800BD98 @ JP 0x0800BD98 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800BD98
	.thumb_func
sub_800BD98:
	push {r4, r5, r6, r7, lr}
	adds r7, r2, #0
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	lsls r1, r1, #0x18
	asrs r5, r1, #0x18
	adds r6, r5, #0
	cmp r4, #0
	bge _0800BDB8
	ldr r0, _0800BDE4 @ =0x0202BCEC
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetROMChapterStruct
	ldrb r4, [r0, #0xc]
_0800BDB8:
	cmp r5, #1
	bne _0800BDC0
	bl sub_8019994
_0800BDC0:
	ldr r0, _0800BDE4 @ =0x0202BCEC
	strb r4, [r0, #0xd]
	bl RefreshEntityBmMaps
	bl sub_8027144
	bl sub_8019914
	cmp r6, #1
	bne _0800BDDC
	movs r0, #1
	adds r1, r7, #0
	bl MakeNew6CBMXFADE2
_0800BDDC:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800BDE4: .4byte 0x0202BCEC

