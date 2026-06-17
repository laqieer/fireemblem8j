	.syntax unified
	.set NextRN_N, 0x08000C58 + 1
	.set sub_803D3E0, 0x0803D3E0 + 1
	.set sub_803F9C0, 0x0803F9C0 + 1
	.section .text.sub_803CA74, "ax", %progbits
@ sub_803CA74 @ JP 0x0803CA74 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803CA74
	.thumb_func
sub_803CA74:
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x64
	bl NextRN_N
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0803CAA4 @ =0x030017C8
	ldr r1, [r1]
	ldrb r1, [r1, #1]
	cmp r0, r1
	bhi _0803CAAC
	ldr r4, _0803CAA8 @ =sub_803C8C4
	adds r0, r4, #0
	bl sub_803F9C0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803CAB4
	adds r0, r4, #0
	bl sub_803D3E0
	b _0803CAB4
	.align 2, 0
_0803CAA4: .4byte 0x030017C8
_0803CAA8: .4byte 0x0803C8C5  @ sub_803C8C4
_0803CAAC:
	ldr r0, _0803CAC0 @ =0x0203AA00
	adds r0, #0x79
	movs r1, #4
	strb r1, [r0]
_0803CAB4:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803CAC0: .4byte 0x0203AA00

