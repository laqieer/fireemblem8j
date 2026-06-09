	.syntax unified
	.set NextRN_N, 0x08000C58 + 1
	.set sub_803D3E0, 0x0803D3E0 + 1
	.set sub_803F9C0, 0x0803F9C0 + 1
	.section .text.sub_803CA14, "ax", %progbits
@ sub_803CA14 @ JP 0x0803CA14 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803CA14
	.thumb_func
sub_803CA14:
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x64
	bl NextRN_N
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0803CA50 @ =0x030017C8
	ldr r1, [r1]
	ldrb r1, [r1, #1]
	cmp r0, r1
	bhi _0803CA5C
	ldr r1, _0803CA54 @ =0x0203AA00
	adds r1, #0x7b
	ldrb r2, [r1]
	movs r0, #2
	orrs r0, r2
	strb r0, [r1]
	ldr r4, _0803CA58 @ =sub_803C7A8
	adds r0, r4, #0
	bl sub_803F9C0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803CA64
	adds r0, r4, #0
	bl sub_803D3E0
	b _0803CA64
	.align 2, 0
_0803CA50: .4byte 0x030017C8
_0803CA54: .4byte 0x0203AA00
_0803CA58: .4byte 0x0803C7A9  @ sub_803C7A8
_0803CA5C:
	ldr r0, _0803CA70 @ =0x0203AA00
	adds r0, #0x79
	movs r1, #4
	strb r1, [r0]
_0803CA64:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803CA70: .4byte 0x0203AA00

