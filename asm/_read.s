	.syntax unified
	.set _swiread, 0x080DA4E4 + 1
	.set error, 0x080DA4B8 + 1
	.set findslot, 0x080DA3C8 + 1
	.set remap_handle, 0x080DA3E8 + 1
	.section .text._read, "ax", %progbits
@ _read @ JP 0x080DA508 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global _read
	.thumb_func
_read:
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r7, r2, #0
	bl remap_handle
	bl findslot
	adds r6, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r7, #0
	bl _swiread
	cmp r0, #0
	bge _080DA532
	movs r0, #1
	rsbs r0, r0, #0
	bl error
	b _080DA548
_080DA532:
	subs r2, r7, r0
	cmp r6, #0x14
	beq _080DA546
	ldr r0, _080DA54C @ =0x03002B40
	lsls r1, r6, #3
	adds r0, #4
	adds r1, r1, r0
	ldr r0, [r1]
	adds r0, r0, r2
	str r0, [r1]
_080DA546:
	adds r0, r2, #0
_080DA548:
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_080DA54C: .4byte 0x03002B40

