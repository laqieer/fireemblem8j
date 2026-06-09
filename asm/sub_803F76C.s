	.syntax unified
	.set NextRN_N, 0x08000C58 + 1
	.set sub_803D3E0, 0x0803D3E0 + 1
	.set sub_80407C4, 0x080407C4 + 1
	.section .text.sub_803F76C, "ax", %progbits
@ sub_803F76C @ JP 0x0803F76C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803F76C
	.thumb_func
sub_803F76C:
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x64
	bl NextRN_N
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r4]
	cmp r0, r1
	bhi _0803F7A8
	bl sub_80407C4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803F7B0
	movs r0, #0x64
	bl NextRN_N
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r4, [r4, #1]
	cmp r0, r4
	bhi _0803F7B0
	ldr r0, _0803F7A4 @ =sub_803C7A8
	bl sub_803D3E0
	b _0803F7B0
	.align 2, 0
_0803F7A4: .4byte 0x0803C7A9  @ sub_803C7A8
_0803F7A8:
	ldr r0, _0803F7B8 @ =0x0203AA00
	adds r0, #0x79
	movs r1, #4
	strb r1, [r0]
_0803F7B0:
	movs r0, #1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0803F7B8: .4byte 0x0203AA00

