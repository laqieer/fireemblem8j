	.syntax unified
	.set remap_handle, 0x080DA3E8 + 1
	.section .text._swiwrite, "ax", %progbits
@ _swiwrite @ JP 0x080DA5E0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global _swiwrite
	.thumb_func
_swiwrite:
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r1, #0
	adds r5, r2, #0
	bl remap_handle
	str r0, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r3, #5
	adds r0, r3, #0
	mov r1, sp
	svc #0xab
	adds r2, r0, #0
	adds r0, r2, #0
	add sp, #0xc
	pop {r4, r5, pc}
	.align 2, 0

