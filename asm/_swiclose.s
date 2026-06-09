	.syntax unified
	.set findslot, 0x080DA3C8 + 1
	.set remap_handle, 0x080DA3E8 + 1
	.section .text._swiclose, "ax", %progbits
@ _swiclose @ JP 0x080DA704 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global _swiclose
	.thumb_func
_swiclose:
	push {lr}
	sub sp, #4
	bl remap_handle
	str r0, [sp]
	bl findslot
	adds r1, r0, #0
	cmp r1, #0x14
	beq _080DA724
	ldr r0, _080DA734 @ =0x03002B40
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r1]
_080DA724:
	movs r3, #2
	adds r0, r3, #0
	mov r1, sp
	svc #0xab
	adds r2, r0, #0
	adds r0, r2, #0
	add sp, #4
	pop {pc}
	.align 2, 0
_080DA734: .4byte 0x03002B40

