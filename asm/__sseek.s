	.syntax unified
	.set _lseek_r, 0x080DA940 + 1
	.section .text.__sseek, "ax", %progbits
@ __sseek @ JP 0x080DA31C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global __sseek
	.thumb_func
__sseek:
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r3, r2, #0
	ldr r0, [r5, #0x54]
	movs r2, #0xe
	ldrsh r1, [r5, r2]
	adds r2, r4, #0
	bl _lseek_r
	adds r1, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _080DA348
	ldr r0, _080DA344 @ =0xFFFFEFFF
	ldrh r2, [r5, #0xc]
	ands r0, r2
	strh r0, [r5, #0xc]
	b _080DA356
	.align 2, 0
_080DA344: .4byte 0xFFFFEFFF
_080DA348:
	movs r2, #0x80
	lsls r2, r2, #5
	adds r0, r2, #0
	ldrh r2, [r5, #0xc]
	orrs r0, r2
	strh r0, [r5, #0xc]
	str r1, [r5, #0x50]
_080DA356:
	adds r0, r1, #0
	pop {r4, r5, pc}
	.align 2, 0

