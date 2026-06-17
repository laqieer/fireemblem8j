	.syntax unified
	.set sub_8009FA8, 0x08009FA8 + 1
	.section .text.sub_8016A68, "ax", %progbits
@ GetItemDisplayRangeString @ JP 0x08016A68 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetItemDisplayRangeString
	.thumb_func
GetItemDisplayRangeString:
	push {r4, r5, lr}
	sub sp, #0x28
	mov r2, sp
	ldr r1, _08016AA8 @ =0x080DC608
	ldm r1!, {r3, r4, r5}
	stm r2!, {r3, r4, r5}
	ldm r1!, {r3, r4, r5}
	stm r2!, {r3, r4, r5}
	ldm r1!, {r3, r4, r5}
	stm r2!, {r3, r4, r5}
	ldr r1, [r1]
	str r1, [r2]
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08016AAC @ =0x0885E068
	adds r1, r1, r0
	ldrb r0, [r1, #0x19]
	adds r1, r0, #0
	cmp r0, #0x22
	beq _08016AE2
	cmp r0, #0x22
	bgt _08016ABA
	cmp r0, #0x11
	beq _08016AD6
	cmp r0, #0x11
	bgt _08016AB0
	cmp r0, #0x10
	beq _08016AD2
	b _08016AF6
	.align 2, 0
_08016AA8: .4byte 0x080DC608
_08016AAC: .4byte 0x0885E068
_08016AB0:
	cmp r0, #0x12
	beq _08016ADA
	cmp r0, #0x13
	beq _08016ADE
	b _08016AF6
_08016ABA:
	cmp r0, #0x3a
	beq _08016AEA
	cmp r0, #0x3a
	bgt _08016AC8
	cmp r0, #0x23
	beq _08016AE6
	b _08016AF6
_08016AC8:
	cmp r1, #0x3f
	beq _08016AEE
	cmp r1, #0xff
	beq _08016AF2
	b _08016AF6
_08016AD2:
	ldr r0, [sp]
	b _08016AF8
_08016AD6:
	ldr r0, [sp, #4]
	b _08016AF8
_08016ADA:
	ldr r0, [sp, #8]
	b _08016AF8
_08016ADE:
	ldr r0, [sp, #0xc]
	b _08016AF8
_08016AE2:
	ldr r0, [sp, #0x10]
	b _08016AF8
_08016AE6:
	ldr r0, [sp, #0x14]
	b _08016AF8
_08016AEA:
	ldr r0, [sp, #0x18]
	b _08016AF8
_08016AEE:
	ldr r0, [sp, #0x1c]
	b _08016AF8
_08016AF2:
	ldr r0, [sp, #0x20]
	b _08016AF8
_08016AF6:
	ldr r0, [sp, #0x24]
_08016AF8:
	bl sub_8009FA8
	add sp, #0x28
	pop {r4, r5}
	pop {r1}
	bx r1

