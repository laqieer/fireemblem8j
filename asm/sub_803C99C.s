	.syntax unified
	.set NextRN_N, 0x08000C58 + 1
	.set sub_803D3E0, 0x0803D3E0 + 1
	.set sub_803F9C0, 0x0803F9C0 + 1
	.section .text.sub_803C99C, "ax", %progbits
@ sub_803C99C @ JP 0x0803C99C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803C99C
	.thumb_func
sub_803C99C:
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x64
	bl NextRN_N
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0803C9D0 @ =0x030017C8
	ldr r1, [r1]
	ldrb r2, [r1, #1]
	cmp r0, r2
	bhi _0803C9F4
	ldr r0, [r1, #8]
	cmp r0, #0
	bne _0803C9D8
	ldr r4, _0803C9D4 @ =sub_803C7A8
	adds r0, r4, #0
	bl sub_803F9C0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803C9FC
	adds r0, r4, #0
	bl sub_803D3E0
	b _0803C9FC
	.align 2, 0
_0803C9D0: .4byte 0x030017C8
_0803C9D4: .4byte 0x0803C7A9  @ sub_803C7A8
_0803C9D8:
	ldr r0, _0803C9EC @ =sub_803C83C
	bl sub_803F9C0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803C9FC
	ldr r0, _0803C9F0 @ =sub_803C7F4
	bl sub_803D3E0
	b _0803C9FC
	.align 2, 0
_0803C9EC: .4byte 0x0803C83D  @ sub_803C83C
_0803C9F0: .4byte 0x0803C7F5  @ sub_803C7F4
_0803C9F4:
	ldr r0, _0803CA08 @ =0x0203AA00
	adds r0, #0x79
	movs r1, #4
	strb r1, [r0]
_0803C9FC:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803CA08: .4byte 0x0203AA00

