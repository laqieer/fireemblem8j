	.syntax unified
	.set _write, 0x080DA604 + 1
	.set abort, 0x080DA918 + 1
	.section .text._sbrk, "ax", %progbits
@ _sbrk @ JP 0x080DA788 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global _sbrk
	.thumb_func
_sbrk:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, _080DA7B8 @ =0x03002B30
	ldr r0, [r4]
	cmp r0, #0
	bne _080DA798
	ldr r0, _080DA7BC @ =0x0203EFB4
	str r0, [r4]
_080DA798:
	ldr r5, [r4]
	adds r0, r5, r6
	cmp r0, sp
	bls _080DA7AE
	ldr r1, _080DA7C0 @ =0x085775A8
	movs r0, #1
	movs r2, #0x20
	bl _write
	bl abort
_080DA7AE:
	ldr r0, [r4]
	adds r0, r0, r6
	str r0, [r4]
	adds r0, r5, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
_080DA7B8: .4byte 0x03002B30
_080DA7BC: .4byte 0x0203EFB4
_080DA7C0: .4byte 0x085775A8

