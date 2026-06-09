	.syntax unified
	.set GetUnitFromCharId, 0x08017FB0 + 1
	.set NextRN_N, 0x08000C58 + 1
	.set sub_803BF14, 0x0803BF14 + 1
	.set sub_803D3E0, 0x0803D3E0 + 1
	.set sub_803F9C0, 0x0803F9C0 + 1
	.section .text.sub_803C904, "ax", %progbits
@ sub_803C904 @ JP 0x0803C904 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803C904
	.thumb_func
sub_803C904:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r0, #0x64
	bl NextRN_N
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r5, _0803C954 @ =0x030017C8
	ldr r1, [r5]
	ldrb r1, [r1, #1]
	cmp r0, r1
	bhi _0803C984
	ldr r0, _0803C958 @ =sub_803C7A8
	bl sub_803F9C0
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #0
	bne _0803C98C
	ldr r0, [r5]
	ldrh r0, [r0, #4]
	bl sub_803BF14
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0803C96C
	ldr r0, [r5]
	ldr r0, [r0, #4]
	bl GetUnitFromCharId
	ldr r0, [r0, #0xc]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0803C960
	ldr r0, _0803C95C @ =0x0203AA00
	adds r0, #0x86
	movs r1, #3
	b _0803C972
	.align 2, 0
_0803C954: .4byte 0x030017C8
_0803C958: .4byte 0x0803C7A9  @ sub_803C7A8
_0803C95C: .4byte 0x0203AA00
_0803C960:
	ldr r0, _0803C968 @ =sub_803C884
	bl sub_803D3E0
	b _0803C98C
	.align 2, 0
_0803C968: .4byte 0x0803C885  @ sub_803C884
_0803C96C:
	ldr r0, _0803C97C @ =0x0203AA00
	adds r0, #0x86
	movs r1, #1
_0803C972:
	strb r1, [r0]
	ldr r0, _0803C980 @ =0x030017C0
	strb r4, [r0]
	b _0803C98C
	.align 2, 0
_0803C97C: .4byte 0x0203AA00
_0803C980: .4byte 0x030017C0
_0803C984:
	ldr r0, _0803C998 @ =0x0203AA00
	adds r0, #0x79
	movs r1, #4
	strb r1, [r0]
_0803C98C:
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803C998: .4byte 0x0203AA00

