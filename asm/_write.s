	.syntax unified
	.set _swiwrite, 0x080DA5E0 + 1
	.set error, 0x080DA4B8 + 1
	.set findslot, 0x080DA3C8 + 1
	.set remap_handle, 0x080DA3E8 + 1
	.section .text._write, "ax", %progbits
@ _write @ JP 0x080DA604 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global _write
	.thumb_func
_write:
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	bl remap_handle
	bl findslot
	adds r7, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl _swiwrite
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _080DA62C
	cmp r0, r6
	bne _080DA634
_080DA62C:
	adds r0, r1, #0
	bl error
	b _080DA64A
_080DA634:
	subs r2, r6, r0
	cmp r7, #0x14
	beq _080DA648
	ldr r0, _080DA64C @ =0x03002B40
	lsls r1, r7, #3
	adds r0, #4
	adds r1, r1, r0
	ldr r0, [r1]
	adds r0, r0, r2
	str r0, [r1]
_080DA648:
	adds r0, r2, #0
_080DA64A:
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_080DA64C: .4byte 0x03002B40

