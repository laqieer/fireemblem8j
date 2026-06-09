	.syntax unified
	.set NextRN_N, 0x08000C58 + 1
	.set sub_803D3E0, 0x0803D3E0 + 1
	.set sub_803F9C0, 0x0803F9C0 + 1
	.section .text.sub_803F720, "ax", %progbits
@ sub_803F720 @ JP 0x0803F720 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803F720
	.thumb_func
sub_803F720:
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x64
	bl NextRN_N
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r3, _0803F754 @ =0x0203AA00
	ldrb r2, [r4, #1]
	adds r1, r3, #0
	adds r1, #0x7c
	strb r2, [r1]
	ldrb r4, [r4]
	cmp r0, r4
	bhi _0803F75C
	ldr r4, _0803F758 @ =sub_803C7A8
	adds r0, r4, #0
	bl sub_803F9C0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803F764
	adds r0, r4, #0
	bl sub_803D3E0
	b _0803F764
	.align 2, 0
_0803F754: .4byte 0x0203AA00
_0803F758: .4byte 0x0803C7A9  @ sub_803C7A8
_0803F75C:
	adds r1, r3, #0
	adds r1, #0x79
	movs r0, #4
	strb r0, [r1]
_0803F764:
	movs r0, #1
	pop {r4}
	pop {r1}
	bx r1

