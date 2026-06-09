	.syntax unified
	.set AddTarget, 0x08050630 + 1
	.set IsItemStealable, 0x08016DFC + 1
	.section .text.sub_8025B44, "ax", %progbits
@ sub_8025B44 @ JP 0x08025B44 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8025B44
	.thumb_func
sub_8025B44:
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r0, #0xb
	ldrsb r0, [r5, r0]
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0x80
	bne _08025B9C
	ldr r0, _08025B90 @ =0x03004DF0
	ldr r0, [r0]
	movs r1, #0x16
	ldrsb r1, [r0, r1]
	movs r0, #0x16
	ldrsb r0, [r5, r0]
	cmp r1, r0
	blt _08025B9C
	movs r6, #0
	adds r4, r5, #0
	adds r4, #0x1e
_08025B6A:
	ldrh r0, [r4]
	cmp r0, #0
	beq _08025B9C
	bl IsItemStealable
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08025B94
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	movs r2, #0xb
	ldrsb r2, [r5, r2]
	movs r3, #0
	bl AddTarget
	b _08025B9C
	.align 2, 0
_08025B90: .4byte 0x03004DF0
_08025B94:
	adds r4, #2
	adds r6, #1
	cmp r6, #4
	ble _08025B6A
_08025B9C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

